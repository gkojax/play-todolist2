#/bin/sh
CLASSPATH=.:./lib/*
PID_FILE=./pidfile
JAVA_HOME=/Library/Java/Home

BACKUP_DIR=`pwd`

cd `dirname $0`
CUR_DIR=`pwd`

start()
{
./jsvc \
        -home $JAVA_HOME \
        -cp $CLASSPATH \
        -pidfile $PID_FILE \
        -Dlogback.configurationFile=./logback.xml \
        -debug -verbose \
        -outfile stdout.log \
        -errfile stderr.log \
        daemon.Application $CUR_DIR
}

stop()
{
./jsvc \
        -stop \
        -pidfile $PID_FILE \
        daemon.Application
}

case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  restart)
        stop
        start
        ;;
  *)
        echo "Usage $0 start/stop"
        exit 1;;
esac

cd $BACKUP_DIR
