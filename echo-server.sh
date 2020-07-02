#!usr/bin/env bash

# Quick start-stop-daemon example, derived from Debian /etc/init.d/ssh
set -e

# Must be a valid filename
NAME=this_is_a_test
PIDFILE=/var/run/$NAME.pid
#This is the command to be run, give the full pathname
DAEMON=/home/Your_User_Name/Your_path/your_script.py

case "$1" in
  start)
        echo -n "Starting daemon: "$NAME
    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS
        echo "."
    ;;
  stop)
        echo -n "Stopping daemon: "$NAME
    start-stop-daemon --stop --quiet --oknodo --pidfile $PIDFILE
        echo "."
    ;;
  restart)
        echo -n "Restarting daemon: "$NAME
    start-stop-daemon --stop --quiet --oknodo --retry 30 --pidfile $PIDFILE
    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_OPTS
    echo "."
    ;;

  *)
    echo "Usage: "$1" {start|stop|restart}"
    exit 1
esac

exit 0
Then I create an installation for the above configuration:

install.sh
#!/usr/bin/env bash

echo "create a test service ..."
cp test.sh /etc/init.d/test
cp test.service /etc/systemd/system
chmod +x /etc/init.d/test
# sed -i "s/Your_User_Name/you_path/g" /etc/init.d/test
echo "created the test service"
