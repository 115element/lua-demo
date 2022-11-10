-- lua字符串

string1 = "lua"
print("\"字符串1是\"",string1)

string2 = 'runoob.com'
print("字符串2是",string2)

string3 = [["lua教程"]]
print("字符串3是",string3)

string4 = [=[sssss]=]
print("字符串4是",string4)


--string.upper(argument):
--字符串全部转为大写字母。

--string.lower(argument):
--字符串全部转为小写字母。

--[[
string.gsub(mainString,findString,replaceString,num)
在字符串中替换。
mainString 为要操作的字符串， findString 为被替换的字符，replaceString 要替换的字符，num 替换次数（可以忽略，则全部替换），如：
]]

s1 = string.gsub("aaaa","a","c",2)
print(s1)

s2,s3 = string.find("hello lua user","lua",1)  --从起始位置1，查找字符串，返回出现的起始位置和结束位置
print(s2,s3)

s4 = string.reverse("lua")      --反转字符串
print(s4)

s5 = string.format("the value is :%d",4);   --格式化字符串
print(s5)

s6 = string.char(97,98,99,100)  --将数字转换为字符
print(s6)

s7 = string.byte("abcd",4)  --将字符转换为数字，该idx标识符表示作为参数传递的字符串索引处的字符。
print(s7) --100

s8 = string.byte("abcd")    --将字符转换为数字，idx不指定，默认是1。
print(s8) --97

s9 = string.len("aaa")     --得到字符串的长度
print(s9) --3


s10 = string.rep("abcd",2)     --返回字符串的n个拷贝
print(s10)


--[[
返回一个迭代器函数，每一次调用这个函数，返回一个在字符串 str 找到的下一个符合 pattern 描述的子串。如果参数 pattern 描述的字符串没有找到，迭代函数返回nil。
]]
for word in string.gmatch("hello lua user","%a+") do
    print(word)
end
--Hello
--Lua
--user


--[[
string.match()只寻找源字串str中的第一个配对. 参数init可选, 指定搜寻过程的起点, 默认为1。
在成功配对时, 函数将返回配对表达式中的所有捕获结果; 如果没有设置捕获标记, 则返回整个配对字符串. 当没有成功的配对时, 返回nil。
]]

s11 = string.match("I have 2 question for you","%d+ %a+")
print(s11)  --返回值： 2 question


s111 = string.match("i have 2 questions for you","(%d+) (%a+)")
print(s111) --返回值： 2


s12 = string.format("%d,%q",string.match("i have 2 questions for you","(%d+) (%a+)"))
print(s12) --返回值： 2,"questions"