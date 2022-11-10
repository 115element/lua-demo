mytable = {}
mytable[1] = "lua"
mytable = nil


mytable = {}
print("mytable的类型是：",type(mytable))

mytable[1] = "lua"
mytable["wow"] = "修改前"
print("mytable索引为1的元素是：",mytable[1])
print("mytable索引为wow的元素是：",mytable["wow"])




fruits = {"banana","orange","apple"}
print("连接后的字符串",table.concat(fruits))
print("连接后的字符串",table.concat(fruits,","))
print("连接后的字符串",table.concat(fruits,",",2,3))

table.insert(fruits,"mongo")
print("索引4的元素为",fruits[4])
table.insert(fruits,2,"grapes") --向指定位置插入元素，原来该位置元素向后移动
print("索引2的元素为",fruits[2])
print("最后一个元素为",fruits[5])


--[[
table.remove(table [, pos])，返回table数组部分位于pos位置的元素. 其后的元素会被前移. pos参数可选, 默认为table长度, 即从最后一个元素删起。
]]
cc = table.remove(fruits)
print(cc)
print("移除后",fruits[1])
print("移除后",fruits[2])
print("移除后",fruits[3])
print("移除后",fruits[4])
print("移除后",fruits[5])