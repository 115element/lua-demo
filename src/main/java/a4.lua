-- table（表）

-- 创建一个空的table
local tab1 = {}

--直接初始化表
local tab2 = {"apple","pear","orange","grape"}
for i, v in pairs(tab2) do
    print("key",i)
end

print("====")

a = {}
a["key"] = "value"
key = 10
a[key] = 22
a[key] = a[key] + 11
for i, v in pairs(a) do
    print(i .. ":" .. v)
end


print("=====")
a3 = {}
for i = 1, 10 do
    a3[i] = i;
end
a3["key"] = "val";
print(a3["key"])
print(a3["none"])
print(a3[1])