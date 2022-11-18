local server = require "resty.websocket.server"

local wb,err = server:new{
    timeout = 30000,
    max_payload_len = 65535,
}

if not wb then 
    ngx.log(ngx.ERR,"failed to new websocket:",err)
    return ngx.exit(444)
end


while true do
   ::start:: 
    ngx.log(ngx.INFO,"开始接收客户端数据：")
    local data,typ,err = wb:recv_frame()  --该方法会阻塞30秒，如果没有接收到数据 
    --[[
        从线路接收 WebSocket 帧。
        如果发生错误，则返回两个nil值和一个描述错误的字符串。
        第二个返回值始终是帧类型，可以是continuation、text、binary、close、ping、pong或nil（对于未知类型）之一。
    ]]
    ngx.log(ngx.INFO,"data==",data," typ==",typ," err==",err)

    if (not data) or (not typ) then
        if not string.find(err,"timeout",1,true) then
            ngx.log(ngx.ERR,"failed to receive a frame",err)
            return ngx.exit(444)
        end

        goto start
    end

    if typ == "close" then 
        local code = err
        local bytes,err = wb:send_close(1000,"enough")
        if not bytes then
            ngx.log(ngx.ERR,"failed to send the close frame",err)
            return
        end
        ngx.log(ngx.INFO,"closing with status code：",code," and message：",data)
        return
    end

    if typ == "ping" then
        local bytes,err = wb:send_pong(data)
        if not bytes then
            ngx.log(ngx.ERR,"failed to send frame",err)
            return
        end
    elseif typ == "pong" then
        -- just discard the incoming pong frame
    else
         ngx.log(ngx.INFO,"received a frame of type：",typ," and payload：",data)
    end

    local bytes,err = wb:send_text("我是服务端!")   --返回在TCP级别上实际发送的字节数，如果错误则返回nil和描述错误的字符串 
    if not bytes then
        ngx.log(ngx.ERR,"failed to send a text frame",err)
        return ngx.exit(444)
    end

    ---增加代码抓取，ping,pong报文
    -- local bytes,err = wb:send_ping("ping")
    -- local bytes,err = wb:send_pong("pong")

    --local bytes,err = wb:send_binary("bal bal bal...") --发送二进制
    --if not bytes then
    --    ngx.log(ngx.ERR,"failed to send a binary frame:",err)
    --    return ngx.exit(444)
    --end
end


local bytes,err = wb:send_close(1000,"enough") --发送close带有可选状态代码和消息的帧。
if not bytes then
    ngx.log(ngx.ERR,"failed to send the close frame:",err)
    return
end


