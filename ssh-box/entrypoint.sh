#!/bin/bash

apt-get update -y
apt-get upgrade -y
echo "2" | apt-get install openssh-server -y

PUB_KEY=/root/.ssh/authorized_keys
PUB_KEY_HOME=$(dirname $PUB_KEY)

if [[ -f $PUB_KEY ]]
then
    echo "Found $PUB_KEY and $PUB_KEY_HOME."
    chmod -R 600 $PUB_KEY_HOME
else
    echo "Missing $PUB_KEY. Cannot proceed."
    exit 1
fi

service ssh restart

while true; do
  echo "Sleeping... this is what this is supposed to do but this keesp the container running forever."
  sleep 1000
done
