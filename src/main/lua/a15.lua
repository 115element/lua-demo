fruits = {"banana","orange","apple","grapes"}
print("排序前")
for i, v in ipairs(fruits) do
    print(i,v)
end

table.sort(fruits)
print("排序后")
for i, v in ipairs(fruits) do
    print(i,v)
end