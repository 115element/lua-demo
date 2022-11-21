# Shell 输入/输出重定向
# 大多数 UNIX 系统命令从你的终端接受输入并将所产生的输出发送到您的终端。
# 一个命令通常从一个叫标准输入的地方读取输入，默认情况下，这恰好是你的终端。
# 同样，一个命令通常将其输出写入到标准输出，默认情况下，这也是你的终端。

# 重定向命令列表如下：
# command > file       将输出重定向到 file。
# command < file       将输入重定向到 file。
# command >> file      将输出以追加的方式重定向到 file。
# n > file             将文件描述符为 n 的文件重定向到 file。
# n >> file            将文件描述符为 n 的文件以追加的方式重定向到 file。
# n >& m               将输出文件 m 和 n 合并。
# n <& m               将输入文件 m 和 n 合并。
# << tag               将开始标记 tag 和结束标记 tag 之间的内容作为输入。

###   需要注意的是文件描述符 0 通常是标准输入（STDIN），1 是标准输出（STDOUT），2 是标准错误输出（STDERR）。
###  "nohup java -jar -DSpring.config.location=$config_file -Dspring.profiles.active=$env $jar_file > /dev/null 2>&1 &"




echo "###############################SHELL文件包含################################"
##  和其他语言一样，Shell 也可以包含外部脚本。这样可以很方便的封装一些公用的代码作为一个独立的文件。

##  Shell 文件包含的语法格式如下：
##  . filename  # 注意点号和文件名中间有一个空格
##  或
##  source filename
. ./1.sh
source /usr/local/2.sh

