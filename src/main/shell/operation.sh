#SHELL基本运算符号


echo "##########################################算术运算符"
val=`expr 2 + 2` #表达式和运算符之间要有空格，例如 2+2 是不对的，必须写成 2 + 2，这与我们熟悉的大多数编程语言不一样。
echo "两数之和：$val"

a=10
b=20

val=`expr $a + $b`
echo "a + b : $val"

val=`expr $a - $b`
echo "a - b : $val"

val=`expr $a \* $b`
echo "a * b : $val"

val=`expr $b / $a`
echo "b / a : $val"

val=`expr $b % $a`
echo "b % a : $val"

if [ $a == $b ]
then
    echo "a 等于 b"
fi

if [ $a != $b ] 
then
    echo "a 不等于 b"
fi

echo "######################################关系运算符"
# -eq 检测两个数是否相等，相等返回 true。 [ $a -eq $b ] 返回 false。
# -ne 检测两个数是否不相等，不相等返回 true。 [ $a -ne $b ] 返回 true。
#-gt 检测左边的数是否大于右边的，如果是，则返回 true。   [ $a -gt $b ] 返回 false。
#-lt 检测左边的数是否小于右边的，如果是，则返回 true。   [ $a -lt $b ] 返回 true。
#-ge 检测左边的数是否大于等于右边的，如果是，则返回 true。   [ $a -ge $b ] 返回 false。
#-le 检测左边的数是否小于等于右边的，如果是，则返回 true。   [ $a -le $b ] 返回 true。

if [ $a -eq $b ]
then
    echo "a 等于 b"
else
    echo "a 不等于 b"    
fi

if [ $a -ne $b ]
then
    echo "a 不等于 b"
else
    echo "a 等于 b"    
fi

if [ $a -gt $b ]
then
    echo "a 大于 b"
else
    echo "a 不大于 b"
fi

if [ $a -lt $b ]
then
    echo "a 小于 b"
else
    echo "a 不小于 b"
fi

if [ $a -ge $b ]
then
    echo "a 大于或等于 b"
else
    echo "a 小于 b"
fi

if [ $a -le $b ]
then 
    echo "a 小于或等于 b"
else
    echo "a 大于 b"
fi


echo "######################################布尔运算符"
# !   非运算，表达式为 true 则返回 false，否则返回 true。 [ ! false ] 返回 true。
# -o  或运算，有一个表达式为 true 则返回 true。   [ $a -lt 20 -o $b -gt 100 ] 返回 true。
# -a  与运算，两个表达式都为 true 才返回 true。   [ $a -lt 20 -a $b -gt 100 ] 返回 false。

if [ $a != $b ]
then
    echo "a 不等于 b"
else
    echo "a 等于 b"
fi    

if [ $a -lt 100 -a $b -gt 15 ]
then
    echo "a 小于 100 且 b 大于 15, 返回true"
else 
    echo "a 小于 100 且 b 大于 15, 返回false"
fi

if [ $a -lt 100 -o $b -gt 15 ]
then
    echo "a 小于 100 或 b 大于 15，返回true"
else
    echo "a 小于 100 或 b 大于 15，返回false"
fi


echo "######################################逻辑运算符"
# &&  逻辑的 AND  [[ $a -lt 100 && $b -gt 100 ]] 返回 false
# ||  逻辑的 OR   [[ $a -lt 100 || $b -gt 100 ]] 返回 true

if [[ $a -lt 100 && $b -gt 100 ]]
then
    echo "返回true"
else
    echo "返回false"
fi    

if [[ $a -lt 100 || $b -gt 100 ]]
then
    echo "返回 true"
else
    echo "返回 false"
fi    



echo "###################################字符串运算符"
# =   检测两个字符串是否相等，相等返回 true。 [ $a = $b ] 返回 false。
# !=  检测两个字符串是否不相等，不相等返回 true。 [ $a != $b ] 返回 true。
# -z  检测字符串长度是否为0，为0返回 true。   [ -z $a ] 返回 false。
# -n  检测字符串长度是否不为 0，不为 0 返回 true。    [ -n "$a" ] 返回 true。
# $   检测字符串是否不为空，不为空返回 true。 [ $a ] 返回 true。

a="abc"
b="efg"

if [ $a = $b ]
then
    echo "$a = $b: a等于b"
else
    echo "$a = $b: a不等于b"
fi

if [ $a != $b ]
then
    echo "a不等于b"
else
    echo "a等于b"
fi

if [ -z $a ]
then
    echo "-z 字符串长度为0"
else
    echo "-z 字符串长度不为0"
fi    

if [ -n $a ]
then
    echo "-n 字符串长度为0"
else
    echo "-n 字符串长度不为0"
fi    

if [ $a ]
then
    echo "$a 字符串不为空"
else 
    echo "$a 字符串为空"
fi


echo "###############################文件测试运算"
# -b file 检测文件是否是块设备文件，如果是，则返回 true。 [ -b $file ] 返回 false。
# -c file 检测文件是否是字符设备文件，如果是，则返回 true。   [ -c $file ] 返回 false。
# -d file 检测文件是否是目录，如果是，则返回 true。   [ -d $file ] 返回 false。
# -f file 检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。 [ -f $file ] 返回 true。
# -g file 检测文件是否设置了 SGID 位，如果是，则返回 true。   [ -g $file ] 返回 false。
# -k file 检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。 [ -k $file ] 返回 false。
# -p file 检测文件是否是有名管道，如果是，则返回 true。   [ -p $file ] 返回 false。
# -u file 检测文件是否设置了 SUID 位，如果是，则返回 true。   [ -u $file ] 返回 false。
# -r file 检测文件是否可读，如果是，则返回 true。 [ -r $file ] 返回 true。
# -w file 检测文件是否可写，如果是，则返回 true。 [ -w $file ] 返回 true。
# -x file 检测文件是否可执行，如果是，则返回 true。   [ -x $file ] 返回 true。
# -s file 检测文件是否为空（文件大小是否大于0），不为空返回 true。    [ -s $file ] 返回 true。
# -e file 检测文件（包括目录）是否存在，如果是，则返回 true。 [ -e $file ] 返回 true。
# -S 判断某文件是否socket
# -L 检测文件是否存在并且是一个符号链接

file="/var/www/runoob/test.sh"
if [ -r $file ]
then 
    echo "文件可读"
else
    echo "文件不可读"
fi    

if [ -w $file ]
then
    echo "文件可写"
else
    echo "文件不可写"
fi    

if [ -x $file ]
then
    echo "文件可执行"
else
    echo "文件不可执行"    
fi

if [ -f $file ]
then
    echo "文件时普通文件"
else
    echo "文件为特殊文件" 
fi

if [ -d $file ]
then 
    echo "文件是个目录"
else
    echo "文件不是个目录"
fi    

if [ -s $file ]
then 
    echo "文件不为空"
else
    echo "文件为空"
fi

if [ -e $file ]
then 
    echo "文件存在"
else
    echo "文件不存在"
fi    























