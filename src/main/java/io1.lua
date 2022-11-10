---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by alex.
--- DateTime: 2022/10/20 10:41
---

--以只读方式打开文件
file = io.open("pair_ipair.lua","r")
--设置默认输入文件为a1.lua
io.input(file)
print(io.read("*n"))
--关闭打开的文件
io.close(file)

--[[
read的模式

"*n"    读取一个数字并返回它，例如：file.read("*n")，如果读到的不是数字返回nil
"*a"    从当前位置读取整个文件，例如：file.read("*a")
"*l"    读取下一行，在文件尾（EOF）处返回nil，例如：file.read("*l")
number  返回一个指定字符个数的字符串，在EOF时返回nil，例如：file.read(5)
]]



--[[

其他的 io 方法有：
io.tmpfile():返回一个临时文件句柄，该文件以更新模式打开，程序结束时自动删除。
io.type(file): 检测obj是否一个可用的文件句柄。
io.flush(): 向文件写入缓冲中的所有数据。
io.lines(optional file name): 返回一个迭代函数，每次调用将获得文件中的一行内容，当到文件尾时，将返回 nil，但不关闭文件。
]]