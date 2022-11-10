print(3 / 2)

-- 关系运算符

a = 21
b = 10

if (a == b) then
    print("a等于b")
else
    print("a不等于b")
end

if (a ~= b) then
    print("a不等于b")
else
    print("a等于b")
end

if (a < b) then
    print("a小于b")
else
    print("a大于等于b")
end

if (a > b) then
    print("a大于b")
else
    print("a小于等于b")
end


-- 修改a和b的值
a = 5
b = 20
if (a <= b) then
    print("a小于等于b")
end

if (b >= a) then
    print("b大于等于a")
end


-- 逻辑运算符
a = true
b = true
if (a and b) then
    print("a and b --条件为true")
end

if (a or b) then
    print("a or b  --条件为true")
end

print("----------分割线---------------")
a = false
b = true

if (a and b) then
    print("a and b - 条件为true")
else
    print("a and b - 条件为false")
end

if (not (a and b)) then
    print("not (a and b) - 条件为true")
else
    print("not (a and b) - 条件为false")
end

print("----------分割线(其它运算符)---------------")
a = "hello"
b = "world"
print("连接字符串a和b", a .. b)
print("b字符串长度", #b)
print("字符串 test 长度", #"test")
