--lua数组#############################################################
array = { "lua", "tutorial" }
for i = 0, 2 do
    print(array[i])
end
--nil
--lua
--tutorial



--###################################################################
--[[
正如你所看到的，我们可以使用整数索引来访问元素，如果指定的索引没有值则返回nil,
在lua索引值是1为起始，但你也可以指定0开始,
除此外我们还可以，以负数为数组的索引值。
]]

arr = {}
for i = -2, 2 do
    array[i] = i * 2
end

for i = -2, 2 do
    print(array[i])
end
-- -4
-- -2
-- 0
-- 2
-- 4



print("--###################################################################多维数组")
arr2 = {}
for i = 1, 3 do
    arr2[i] = {}
    for j = 1, 3 do
        arr2[i][j] = i * j;
    end
end
---访问数组
for i = 1, 3 do
    for j = 1, 3 do
        print(arr2[i][j])
    end
end



--[[
无状态的迭代器
无状态的迭代器是指不保留任何状态的迭代器，因此在循环中我们可以利用无状态迭代器避免创建闭包花费额外的代价。

每一次迭代，迭代函数都是用两个变量（状态常量和控制变量）的值作为参数被调用，一个无状态的迭代器只利用这两个值可以获取下一个元素。
这种无状态迭代器的典型的简单的例子是 ipairs，它遍历数组的每一个元素，元素的索引需要是数值。
以下实例我们使用了一个简单的函数来实现迭代器，实现 数字 n 的平方：
]]--
function square(iteratorMaxCount, currentNumber)
    if currentNumber < iteratorMaxCount
    then
        currentNumber = currentNumber + 1
        return currentNumber, currentNumber * currentNumber
    end
end

for i, n in square, 3, 0
do
    print(i, n)
end


