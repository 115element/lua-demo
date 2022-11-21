




## echo -n 表示要输出的内容不换行
## 
##     $echo -n "abc"
##     $echo "456"
## 
##     上面的输出则时adc456
## 
##     
##     $echo  "abc"
##     $echo "456"
## 
##     上面的输出则时
## 
##     adc
##     456
## 
## echo -e ：处理遇到的一些转义字符时,不按照一般的字符处理，而当转义字符处理
————————————————

echo "it is a test"

#这里的双引号可以完全省略，以下命令与上面实例效果一致
echo it is a test

#显示转义字符,同样，双引号也可以省略
echo "\"it is a test\""
echo \"it is a test\"

echo "-请输入-"
read name
echo "$name It is a test"


#显示换行
echo -e "ok! \n"    # -e 选项代表开启转义
echo -e "ok! \c"    # -e 选项代表开启转义 \c 不换行


###显示结果定向至文件,它会在当前目录创建一个1.txt文件
echo "it is a test" > 1.txt


#原样输出字符串，不进行转义或取变量(用单引号)
echo '$name\"'
#输出结果：$name\"


echo `date`
