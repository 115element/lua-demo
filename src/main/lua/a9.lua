--Lua函数可以返回多个结果值，比如string.find，其返回匹配串"开始和结束的下标"（如果不存在匹配串返回nil）
s, e = string.find("www.runoob.com", "runoob")
print(s, e) --s为开始下标，e为结束下标

---多返回值函数
function maximum(a)
    local mi = 1
    local m = a[mi]
    for i, v in ipairs(a) do
        if v > m then
            mi = i
            m = v
        end
    end
    return m, mi
end
print(maximum({ 8, 10, 23, 12, 5 }))



----可变参数
function add(...)
    local s = 0
    for i, v in ipairs { ... } do
        --> {...}表示一个由所有变长参数构成的数组
        s = s + v
    end
    return s
end
print(add(3, 4, 5, 6, 7))



--###   #arg获取参数的个数
print("----")
function average(...)
    result = 0
    local arg = { ... }     --> arg为一个表，局部变量
    for i, v in ipairs(arg) do
        result = result + v
    end
    print("总共传入" .. #arg .. "个数")
    return result / #arg
end

print("平均值为：", average(10, 5, 3, 4, 5, 6))



--###   可以通过select("#",...)来获取可变参数的数量
function average(...)
    result = 0
    local arg = { ... }
    for i, v in ipairs(arg) do
        result = result + v
    end
    print("总共传入：" .. select("#", ...) .. "个数")
    return result / select("#", ...)
end
print("平均值为", average(10, 5, 3, 4, 5, 6))


--  select('#', …) 返回可变参数的长度。
--  select(n, …) 用于返回从起点 n 开始到结束位置的所有参数列表。

function fwrite(fmt, ...)
    -->固定参数fmt
    return io.write(string.format(fmt, ...))
end

fwrite("runoob\n")          --->fmt = "runoob",没有变长参数
fwrite("%d%d\n", 1, 2)      --->fmt = "%d%d",变长参数为1和2



--  select('#', …) 返回可变参数的长度。
--  select(n, …) 用于返回从起点 n 开始到结束位置的所有参数列表。
print("+=+=+=+=+=")
function f(...)
    a = select(3,...)   -->从第三个位置开始，变量a对应右边变量列表的第一个参数
    print(a)
    print(select(3,...))  -->打印所有参数列表
end

f(0,1,2,3,4,5)