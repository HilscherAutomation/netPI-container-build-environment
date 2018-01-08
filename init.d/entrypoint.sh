#!/bin/bash -e
# catch signals as PID 1 in a container

# SIGNAL-handler
term_handler() {
 
  echo "terminating docker daemon ..."
  /etc/init.d/docker stop
  
  echo "terminating ssh ..."
  /etc/init.d/ssh stop

  exit 143; # 128 + 15 -- SIGTERM
}

# on callback, stop all started processes in term_handler
trap 'kill ${!}; term_handler' SIGINT SIGKILL SIGTERM SIGQUIT SIGTSTP SIGSTOP SIGHUP

# run applications in the background
echo "starting ssh ..."
/etc/init.d/ssh start &

# start docker deamon
echo "starting docker daemon ..."
/etc/init.d/docker start &

# wait forever not to exit the container
while true
do
  tail -f /dev/null & wait ${!}
done

exit 0
