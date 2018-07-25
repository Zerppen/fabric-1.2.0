#!/bin/bash

function setdownNetwork() {
 source network_setup.sh down mychannel 3000 couchdb
}

echo "===> down network only remove docker containers"
setdownNetwork
