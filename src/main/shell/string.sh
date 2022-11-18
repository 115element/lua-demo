#查找子字符串
#查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)：
string="runoob is a great site"
i=`expr index "$string" io`  # 输出 4
echo $i


#截取字符串(以下实例从字符串第 2 个字符开始截取 4 个字符：)
string1="runoob is a great site"
echo ${string1:1:4} #输出 unoo

