#在Shell中，如果 else 分支没有语句执行，就不要写这个 else。

if [ $(ps -ef | grep -c "ssh") -gt 1 ]; then echo "true"; fi


a=10
b=3
if (( a > b )); then
    echo "a > b"
fi


echo "##################################"
a=10
b=20
if [ $a == $b ]
then
    echo "a 等于 b"
elif [ $a -gt $b ]
then
    echo "a 大于 b"
elif [ $a -lt $b ]
then
    echo "a 小于 b"
else
    echo "没有符合的条件"    
fi   


echo "##################################"
if (( $a == $b ))
then
    echo "a == b"
elif (( $a > $b ))
then
    echo "a > b"
elif (( $a < $b ))
then
    echo "a < b"
else
    echo "见鬼"
fi    


echo "##################################"
num1=$[2*3]
num2=$[1+5]
if test $[num1] -eq $[num2]
then
    echo "相等"
else    
    echo "不相等"
fi    


echo "##################################for循环"
for var in item1 item2 item3 itemN
do
    echo $var
done

#写成一行的写法
for var in i1 i2 i3 iN; do echo $var; done


for loop in 1 2 3 4 5
do
    echo "the value is $loop"
done    

int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done
#以上实例使用了 Bash let 命令，它用于执行一个或多个表达式，变量计算中不需要加上 $ 来表示变量，具体可查阅：Bash let 命令


a=0
until [ ! $a -lt 10 ]
do
    echo $a
    a=`expr $a + 1`
done



echo "#############################case"
echo "输入1到4之间的数字"
echo "你输入的数字为："
read aNum
case $aNum in
    1) echo "选1"
    ;;
    2) echo "选2"
    ;;
    3) echo "选3"
    ;;
    4) echo "选4"
    ;;
    *) echo "其它"
    ;;
esac


site="runoob"
case $site in
   "runoob") echo "菜鸟教程"
   ;;
   "google") echo "google搜索"
   ;;
   "taobao") echo "购物"
   ;;
esac




echo "########################跳出循环--break"
while :
do
    echo -n "输入1到5之间的数字："
    read aNum
    case $aNum in
        1|2|3|4|5) echo "您输入的数字为 $aNum"
        ;;
        *) echo "游戏结束"
            break
        ;;
    esac
done


echo "########################跳出循环--continue"
while :
do
    echo -n "输入1到5之间的数字："
    read aNum
    case $aNum in
        1|2|3|4|5) echo "输入的为：$aNum"
        ;;
        *) echo "输入数字不是1到5之间"
            continue
            echo "这里永远不会执行"
        ;;
    esac
done


