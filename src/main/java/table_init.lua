-- lua的table的初始化

--1、创建一个table
local a1 = {}



--2、初始化一个table
local a2 = { ["x"] = 12, ["mutou"] = 99, [3] = "hello" }
print(a2.mutou)



--3、更简洁的方式
local a3 = { x = 112, mutou = 99, [3] = "hello" }
print(a3["x"])



--4、更更加简介的方式
local a4 = { x = 1211, mutou = 99, [3] = "hello" }
print(a4.x)
print(a4["x"])



--记住，字符串下标才这么做
--记住，字符串下标才这么做
--记住，字符串下标才这么做



--5、想要默认数字索引怎么办
local a5 = { [1] = 12, [2] = 43, [3] = 45, [4] = 99 }
--简介版：
local a6 = { 12, 34, "ee", 56, 78 }
print(a6[1])
print(a6[2])
print(a6[3])
print(a6[4])


--6、更加强大的table之table
local a = {
    { x = 111, y = 222 },
    { x = 333, y = 110 }
}
print(a[1].x)



--7、更加强大的应用之函数下标
function test()
    print("hello table")
end
local a7 = { [test] = 11 }
print(a7[test])



--lua表的7中初始化方式


local aa = {}
if next(aa) == nil then
    print("a 是空表")
else
    print("a 不是空表")
end