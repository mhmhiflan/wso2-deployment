#!/bin/bash

echo 'WSO2 micro integrator deployment STARTED...'
oc project test-hiflan

#create WSO2 ConfigMaps
echo 'Config maps creation started ...'
oc apply configmap backendurlamdocs --from-literal=AmdocsREST=https://192.168.69.2:8643/bus-server/webapi/v0.14/MM/accounts/{uri.var.identifierType}/{uri.var.identifier}

echo 'Image stream creation started ...'
oc apply -f image-stream-config.yml
