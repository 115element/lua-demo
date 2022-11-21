#!/bin/bash
array_name=(v1 v2 v3 v4 v5)

array_name[0]=v11

#读取数组指定索引位置元素值
echo ${array_name[0]}


#使用@符号可以获取数组中的所有元素
echo ${array_name[@]}


###获取数组的长度
#方式1：取得数组元素的个数
length1=${#array_name[@]}
#方式2：
length2=${#array_name[*]}

#取得数组中单个元素的长度
lengthn=${#array_name[0]}
echo $length1 $length2 $lengthn


my_array=(A B "C" D)
#读取数组元素格式：${my_array[index]}
echo ${my_array[2]}
echo "数组的元素为：${my_array[*]}"
echo "数组的元素为：${my_array[@]}"
echo "数组的长度为：${#my_array[*]}"
echo "数组的长度为：${#my_array[@]}"


# declare -A array_name    -A选项就是用于声明一个关联数组的
declare -A site
site["google"]="www.google.com"
site["runoob"]="www/runoob.com"
site["taobao"]="www.taobao.com"
echo "数组的键为：${!site[*]}"
echo "数组的键为：${!site[@]}"



