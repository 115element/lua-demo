---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by alex.
--- DateTime: 2022/10/20 10:41
---

--以只读方式打开文件
file = io.open("pair_ipair.lua","r")
--设置默认输入文件为a1.lua
io.input(file)
--输出文件第一行
print(io.read())
--关闭打开的文件
io.close(file)


--以附加的方式打开只写文件
file1 = io.open("type.lua","a")
--设置默认的输出文件为a2.lua
io.output(file1)
--在文件的最后一行添加lua注释
io.write("\n-- 文件末尾注释")
io.close(file1)