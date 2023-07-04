#!/bin/bash

exit_handler() {
  # Execute the shutdown commands
  echo -e "stopping script"
  exit 0
}

# Exit trap
echo -e "Loading exit handler"
trap exit_handler SIGQUIT SIGINT SIGTERM

/app/hello-world.sh
#--- send sleep into the background, then wait for it.
sleep infinity &
#--- "wait" will wait until the command you sent to the background terminates, which will be never.
#--- "wait" is a bash built-in, so bash can now handle the signals sent by "docker stop"
wait