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


-- 字符转换
-- 转换第一个字符
local q = string.byte("8cce7e16", 1)
print(q)

local var = string.char(q)
print(var)

local v1 = tonumber(var,16) * 16
print(v1)


task_id = tonumber(119) or 0
print(task_id)

str = tostring(123)
print(str)


local tab1 = {}
tab1["1"] = 1
tab1["2"] = 2
tab1["3"] = 3
print(#tab1)
--结果为0