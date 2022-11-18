--[[
table
Lua 中的表（table）其实是一个"关联数组"（associative arrays），
数组的索引可以是数字、字符串或表类型。在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表。
]]

local tabFiles1 = {
    [1] = "test2",
    [6] = "test3",
    [4] = "test1"
}

for i, v in ipairs(tabFiles1) do
    print(i, v)      ----输出"test2",在key等于2处断开。
end

print("=====================")

local tabFiles2 = {
    [2] = "test2",
    [6] = "test3",
    [4] = "test1"
}

for i, v in ipairs(tabFiles2) do
    print(i, v)      ----[[什么都没输出，为什么？因为控制变量初始值是按升序来遍历的，当key为1时，value为nil，此时便停止了遍历， 所以什么结果都没输出]]--
end

print("=====================")

local tabFiles3 = {
    [2] = "test2",
    [6] = "test3",
    [4] = "test1"
}

for i, v in pairs(tabFiles3) do
    print(i, v)      ----输出： 2 test2, 6 test3, 4 test1
end

print("=====================")

local tabFiles4 = { "alpha", "beta", [3] = "no", ["two"] = "yes" }

for i, v in ipairs(tabFiles4) do
    print(i, tabFiles4[i])     ----输出前三个   备注：因为第四个key不是整数
end

for i, v in pairs(tabFiles4) do
    print(i, tabFiles4[i])      ----全部输出
end