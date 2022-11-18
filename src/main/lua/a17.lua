local reply = {}
reply.code = "1"
reply.desc = "dd"

for i, v in pairs(reply) do
    print(i,v)
end


print(string.char(123 or 0)) --将十进制值转换为字符表示。


local ee = {{"","53"}}

for i, v in pairs(ee) do
    for i1, v1 in pairs(v) do
        print(i1,v1)
    end
end

