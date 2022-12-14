
echo "shell参数传递示例！"

echo "命令行执行的文件名：$0"
echo "命令行第一个参数为：$1"
echo "命令行第二个参数为：$2"
echo "命令行第三个参数为：$3"


echo "传递到脚本的参数个数：$#"
### $*的作用：以一个单字符串显示所有向脚本传递的参数。如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。
### $@的作用：与$*相同，但是使用时加引号，并在引号中返回每个参数。如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
echo "脚本运行的当前进程ID号：$$"
echo "后台运行的最后一个进程的ID号：$!"
echo "显示Shell使用的当前选项，与set命令功能相同：$-"
echo "显示最后命令的退出状态，0表示没有错误，其他任何值表明有错误：$?"

echo "-- \$* 演示 --"
for i in "$*"; do
    echo $i   
done

echo "-- \$@ 演示 --"
for i in "$@"; do
    echo $i
done
