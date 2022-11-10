a = 5;          --全局变量
local b = 5;    --局部变量

function joke()
    c = 5       --全局变量
    local d = 6; --局部变量
end

joke()
print(c, d)

do
    local a = 6
    b = 6
    print(a, b)
end

print(a, b)

--a = "hello" .. "world"
--t.n = t.n + 1


print("=============================")
x, y = 10, 20;   --- x=10; y=20
print(x, y)

x, y = y, x       -- 交换x和y的值
--  a[i],a[j] = a[j],a[i]   --交换两者的值
print(x, y)
print("=============================")



a, b, c = 0, 1
print(a, b, c)  -- 0 1 nil

a, b = a + 1, b + 1, b + 2    -- b+2将被忽略
print(a, b)

a, b, c = 0
print(a, b, c)       -- 0 nil nil

--[[注意：如果要对多个变量赋值必须依次对每个变量赋值。]]



--索引
site = {}
site["key"] = "www.ss.com"
print(site["key"])
print(site.key) -- 当索引为字符串类型时的一种简化写法



