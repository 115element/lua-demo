#!/usr/bin/env bash

you_name="hello"
echo $you_name
echo ${you_name}

str="Hello,I know you are ${you_name}"
echo str


for skill in ada coffe action java; do
        echo "i am at ${skill}"
done


name="runoob"
#使用双引号拼接,双引号可以有变量，可以出现转移字符，但是单引号不行
g1="hello,"$name"!"
g2="hello,${name}!"
g3='hello,${name}!'
echo $g1 $g2 $g3
