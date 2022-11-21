echo "hello shell"
printf "hello shell\n"


printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876


#  %s %c %d %f 都是格式替代符，％s 输出一个字符串，％d 整型输出，％c 输出一个字符，％f 输出实数，以小数形式输出。
#  %-10s 指一个宽度为 10 个字符（- 表示左对齐，没有则表示右对齐），任何字符都会被显示在 10 个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来。
#  %-4.2f 指格式化为小数，其中 .2 指保留2位小数。


#format-string为双引号
printf "%d %s\n" 1 "abc"

#单引号与双引号效果一样
printf '%d %s\n' 1 "abc"

#没有引号也可以输出
printf %s abcdef

#格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf %s abc def

printf "%s\n" abc def

printf "%s %s %s\n" a b c d e f g h i j

#如果没有arguments,那么%s 用NULL代替，%d用0代替
printf "%s and %d \n"

echo "#####################printf的转义序列"
#  \a  警告字符，通常为ASCII的BEL字符
#  \b  后退
#  \c  抑制（不显示）输出结果中任何结尾的换行字符（只在%b格式指示符控制下的参数字符串中有效），而且，任何留在参数里的字符、任何接下来的参数以及任何留在格式字符串中的字符，都被忽略
#  \f  换页（formfeed）
#  \n  换行
#  \r  回车（Carriage return）
#  \t  水平制表符
#  \v  垂直制表符
#  \\  一个字面上的反斜杠字符
#  \ddd    表示1到3位数八进制值的字符。仅在格式字符串中有效
#  \0ddd   表示1到3位的八进制值字符

printf "a string, no processing:<%s>\n" "A\nB"
#a string, no processing:<A\nB>

printf "a string, no processing:<%b>\n" "A\nB"
#a string, no processing:<A
#B>

printf "www.runoob.com \a"
#www.runoob.com 



