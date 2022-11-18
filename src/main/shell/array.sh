
#定义一个数组，各个元素之间用空格隔开
array_name=(11 22 33 44 55)
echo ${array_name[0]}
echo ${array_name[1]}
echo ${array_name[2]}
echo ${array_name[3]}
echo ${array_name[4]}


#使用 @ 符号可以获取数组中的所有元素，例如：
echo ${array_name[@]}

# 取得数组元素的个数
length=${#array_name[@]}
echo $length
# 或者
length=${#array_name[*]}
echo $length

# 取得数组单个元素的长度
lengthn=${#array_name[n]}
echo $lengthn



##多行注释用法1
:<<EOF
注释内容...
注释内容...
注释内容...
EOF


##多行注释用法2
:<<!
注释内容...
注释内容...
注释内容...
!
