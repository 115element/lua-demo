#!/bin/sh
#
# nginx - this script starts and stops the nginx daemon
#
# chkconfig:   - 85 15
# description:  Nginx is an HTTP(S) server, HTTP(S) reverse \
#               proxy and IMAP/POP3 proxy server
# processname: nginx
# config:      /etc/nginx/nginx.conf
# config:      /etc/sysconfig/nginx
# pidfile:     /var/run/nginx.pid

# Source function library.
. /etc/rc.d/init.d/functions

# Source networking configuration.
. /etc/sysconfig/network

# Check that networking is up.
[ "$NETWORKING" = "no" ] && exit 0


setting=''
#判断传入参数是否正确
if [ -z $2 ] || [ $2 == "test" -o $2 == "prod" -o $2 == "dev" ] ; then
	setting=$2
fi

#获取当前目录变量
path=$(cd `dirname $0`/..; pwd)
cd $path


#获取程序根目录下面的程序名
if [ `ls -1 $path/sbin/*.jar | wc -l ` -ne 1 ]; then
	exit 0
fi


prog=$(basename sbin/*.jar)
prog_file="$path/sbin/$prog"

lockfile="$path/run/$prog"
pidfile="$path/run/${prog}.pid"



progold=$(basename run/*.jar)
lockfileold="$path/run/$progold"
pidfileold="$path/run/${progold}.pid"



prog_config_file="$path/config/application.properties"

DAEMON_COREFILE_LIMIT='unlimited'

#增加nginx需要的动态lib库目录
#export LD_LIBRARY_PATH="$path/luajit/lib"


start() {
	if [ -z $setting ] ;then  echo "启动环境参数不正确!" ; exit ; fi
#    [ -x $prog_file ] || exit 5
    [ -f $prog_config_file ] || exit 6
    echo -n $"Starting AsiaShiro: "
#	echo $prog_config_file
#	echo $setting
#	echo $prog_file
    daemon --pidfile=$pidfile --check=$prog_file  "java -jar -DSpring.config.location=$prog_config_file -Dspring.profiles.active=$setting $prog_file  > /dev/null 2>&1 &"
    retval=$?
	pid=$(pgrep -f $prog)
    echo
    [ $retval -eq 0 ] && touch $lockfile && echo -n $pid > $pidfile
    return $retval
}

stop() {
    echo -n $"Stopping AsiaShiro: "
    killproc -p $pidfileold $progold
    retval=$?
    echo
    [ $retval -eq 0 ] && rm -f $lockfileold && rm -f pidfileold
    return $retval
}

restart() {
#    configtest_q || return 6
    stop
    start
}

#reload() {
#    configtest_q || return 6
#    echo -n $"Reloading $prog: "
#    killproc -p $pidfile $prog -HUP
#    echo
#}

#configtest() {
#    $nginx -t -c $NGINX_CONF_FILE -p $path
#}
#
#configtest_q() {
#    $nginx -t -q -c $NGINX_CONF_FILE -p $path
#}

rh_status() {
    status -p $pidfile $prog
}

rh_status_q() {
    rh_status >/dev/null 2>&1
}


rh_statusold() {
    status -p $pidfileold $progold
}

rh_status_qold() {
    rh_statusold >/dev/null 2>&1
}

## Upgrade the binary with no downtime.
#upgrade() {
#    local oldbin_pidfile="${pidfile}.oldbin"
#
#    configtest_q || return 6
#    echo -n $"Upgrading $prog: "
#    killproc -p $pidfile $prog -USR2
#    retval=$?
#    sleep 1
#    if [[ -f ${oldbin_pidfile} && -f ${pidfile} ]];  then
#        killproc -p $oldbin_pidfile $prog -QUIT
#        success $"$prog online upgrade"
#        echo 
#        return 0
#    else
#        failure $"$prog online upgrade"
#        echo
#        return 1
#    fi
#}
#
## Tell nginx to reopen logs
#reopen_logs() {
#    configtest_q || return 6
#    echo -n $"Reopening $prog logs: "
#    killproc -p $pidfile $prog -USR1
#    retval=$?
#    echo
#    return $retval
#}
#
case "$1" in
    start)
        rh_status_q && exit 0
        $1
        ;;
    stop)
        rh_status_qold || exit 0
        $1
        ;;
    restart|configtest|reopen_logs)
        $1
        ;;
    force-reload|upgrade) 
        rh_status_q || exit 7
        upgrade
        ;;
    reload)
        rh_status_q || exit 7
        $1
        ;;
    status|status_q)
        rh_$1
        ;;
    condrestart|try-restart)
        rh_status_q || exit 7
        restart
	    ;;
    *)
        echo $"Usage: $0 {start|stop|status|restart}"
        exit 2
esac
