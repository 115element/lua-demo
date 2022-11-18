--将16进制转换为ip表现形式
local function nip2sip(nip)
    local t, j = {}, 1
    for i = 1, 8, 2 do
        t[j] = tonumber(string.char(string.byte(nip, i)), 16) * 16 + tonumber(string.char(string.byte(nip, i + 1)), 16)
        j = j + 1
    end
    return table.concat(t, '.')
end

local s = nip2sip("8cce7e16")
print(s)

local q = string.byte("8cce7e16", 1) --将指定索引位置的字符，通过ASCII码表，转换为10进制数字
print(q)

local var = string.char(q)  --将指定数字，通过ASCII码表，转换为字符显示
print(var)

s1 = [=[
这个函数有一个额外的参数base可用来指定参数的进制:
（1）默认参数值是10
（2）参数的取值范围是[2, 36]
（3）当参数值超过10时，使用A代表10（大小写都可以），B代表11，以此类推最后Z代表35
]=]
local v1 = tonumber(var, 10)
print(v1)

task_id = tonumber(119) or 0
print(task_id)

str = tostring(123)
print(str)

print("=========================")
local tab1 = {}
tab1["1"] = 1
tab1["2"] = 2
tab1["3"] = 3
print(#tab1)
--结果为0

local tab2 = {}
tab2[1] = 1
tab2[2] = 2
tab2[3] = 3
print(#tab2)
--结果为3