#!/bin/bash

FABRIC_TAG=1.2.0
FABRIC_DEPEND=0.4.10
TAG_LATEST=latest
function downloadImages() {
   
   for IMAGES in orderer ccenv peer ca tools; do
       echo "==> FABRIC IMAGE: $IMAGES"
       echo
       docker pull hyperledger/fabric-$IMAGES:$FABRIC_TAG
       docker tag  hyperledger/fabric-$IMAGES:$FABRIC_TAG hyperledger/fabric-$IMAGES:TAG_LATEST
   done
   for IMAGES in zookeeper kafka couchdb; do
       echo "==> FABRIC IMAGE: $IMAGES"
       echo
       docker pull hyperledger/fabric-$IMAGES:$FABRIC_DEPEND
        docker tag  hyperledger/fabric-$IMAGES:$FABRIC_DEPEND  hyperledger/fabric-$IMAGES:TAG_LATEST
   done
}

function setupNetwork() {
 source network_setup.sh up mychannel 3000 couchdb
}

echo "===> pull fabric images,it needs long time"
downloadImages

echo "===> List out hyperledger docker imaes"
docker images | grep hyperledger*
echo
echo "===> setup fabric network"
setupNetwork


echo
echo "===> fabric network setup"



