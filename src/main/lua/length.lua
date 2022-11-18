--- lua的table可以用数字或字符串等作为key，
--- #号得到的是用整数作为索引的最开始连续部分的大小,
--- 如果t[1] == nil, 即使t[5], t[6], t[7]是存在的，#t仍然为零。对于这类tb[1],tb[2]....才能获取到正确的长度。

local tab = {}
tab[1] = 1
tab[2] = 2
tab[3] = nil
print(#tab)
--结果为2


local tab2 = {}
tab2[1] = nil
tab2[2] = 2
tab2[3] = 3
print(#tab2)
--结果为0


---如果table的第一个元素key为非数字，那么#tb获取到的长度也是0。
local tab1 = {}
tab1["1"] = 1
tab1["2"] = 2
tab1["3"] = 3
print(#tab1)
--结果为0



---因此，在平时开发过程中不建议使用#来直接获取table的元素个数。
---建议采用下面的封装方法，获取table的元素个数。注意，print(table.length(tab))，
---结果为2，记录的是非nil的元素。print(table.length(tab1))结果为3。
function table.length(t)
    local i = 0
    for k, v in pairs(t) do
        i = i + 1
    end
    return i
end
print(table.length(tab1))
print(table.length(tab2))

providers = { "T2", "T3", "T4", "T5" }
print("数量：" .. #providers)
print("内容：" .. providers[1])

print(type(providers) == "table")

for i1 = 1, 10, 2 do --从1到10，每次步长为2
    print("--")
end




