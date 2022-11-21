#!/bin/bash

your_name="runoob.com"

#命令只能使用英文字母。数字和下划线，首个字符不能以数字开头。
#中间不能有空格，可以使用下划线_。
#不能使用标点符号。
#不能使用bash里的关键字(可用help命令查看保留关键字)。



#当do与语句写在一行时，需要加分号
for file in `ls /etc`; do
	echo "$file"
done


#当do与语句不写在一行时，可以不加分号
for file in $(ls /etc) 
do
	echo $file
done


youname="qinya"
echo $youname
echo ${youname}



str="this is a \"\"  string"
#使用-e 将转义后的内容输出到屏幕上
echo -e $str 

#双引号里可以有变量
#双引号里可以出现转义字符
#单引号里的任何字符串都会原样输出，单引号字符串的变量是无效的 
#单引号字串中不能出现单独一个的单引号(对单引号使用转义符后也不行)，但可成对出现，作为字符串拼接使用。

###拼接字符串
yy="runoob"

#使用双引号拼接
greeting="hello,"$yy" !"
greeting_1="hello,${yy}!"
echo $greeting $greeting_1

#使用单引号拼接
greeting_2='hello,'$yy' !'
greeting_3='hello,${yy} !' 
echo $greeting_2 $greeting_3
