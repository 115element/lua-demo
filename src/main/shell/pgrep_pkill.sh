#!/bin/bash

cd /                #切换到根目录
pgrep -f ./web.jar  #匹配出含web.jar的进程 并输出进程的pid
pkill -f ./web.jar  #杀掉含web.jar的所有进程