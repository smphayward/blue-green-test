echo "██████  ███████ ██████  ██ ███████ "
echo "██   ██ ██      ██   ██ ██ ██      "
echo "██████  █████   ██   ██ ██ ███████ "
echo "██   ██ ██      ██   ██ ██      ██ "
echo "██   ██ ███████ ██████  ██ ███████ "
echo
echo
echo " ██████ ██   ██  █████   ██████  ███████     ████████ ███████ ███████ ████████ "
echo "██      ██   ██ ██   ██ ██  ████ ██             ██    ██      ██         ██    "
echo "██      ███████ ███████ ██ ██ ██ ███████        ██    █████   ███████    ██    "
echo "██      ██   ██ ██   ██ ████  ██      ██        ██    ██           ██    ██    "
echo " ██████ ██   ██ ██   ██  ██████  ███████        ██    ███████ ███████    ██    "
echo
echo

CONTAINERS=("redis-a-1" "redis-a-3" "redis-a-3" "redis-sentinel-a-1" "redis-sentinel-a-2" "redis-sentinel-a-3")

while :
do

  echo
  echo "--- press CTRL+C at any time to stop the cha0s test ---"
  echo

  for c in ${CONTAINERS[@]}; do

    echo "Stopping container ${c}"
    sudo docker stop ${c}
    
    WAIT_SEC=$(shuf -i 5-15 -n 1)
    echo "Waiting ${WAIT_SEC} seconds"
    sleep ${WAIT_SEC}

    echo "Starting container ${c}"
    sudo docker start ${c}

    WAIT_SEC=$(shuf -i 5-15 -n 1)
    echo "Waiting ${WAIT_SEC} seconds"
    sleep ${WAIT_SEC}

    # Start the container
    
    # Wait for a random length of time

  done

done