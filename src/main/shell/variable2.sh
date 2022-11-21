#!/bin/bash

str1="abcd"
echo ${#str1} #输出4

#变量为数组时。${#str1} 等价于 ${#str1[0]}

str2="dcba"
echo ${#str2[0]} #输出4


str3="run is a great site"
echo ${str3:1:4}

str4="run is great site"
echo `expr index "$str4" io`  #查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)
