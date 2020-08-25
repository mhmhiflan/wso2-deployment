#!/bin/bash

echo 'WSO2 micro integrator deployment STARTED...'
oc project test-hiflan

#create WSO2 ConfigMaps
echo 'Config maps creation started ...'
oc apply configmap backendurlamdocs --from-literal=AmdocsREST=https://192.168.69.2:8643/bus-server/webapi/v0.14/MM/accounts/{uri.var.identifierType}/{uri.var.identifier}
oc apply configmap amdocsapikey  --from-literal=AMDOCS_API_KEY=495ec02230764b96a1c1962f08f155d3
oc apply configmap amdocsclientid  --from-literal=AMDOCS_CLIENT_ID=2ae426d409aa4b3cae1ef2eeb87a5388
oc apply configmap amdocsesbuserencodedcreds  --from-literal=AMDOCS_ESB_USER_ENCODED_CREDS=Y2hha3JheToyMDIw
oc apply configmap amdocssetemailrest  --from-literal=AmdocsSetEmailREST=https://192.168.69.2:8643/bus-server/webapi/v0.14/MM/accounts/{uri.var.msisdn}
oc apply configmap mysqlpassword  --from-literal=MYSQL_PASSWORD=xWTp29CW
oc apply configmap mysqlsurepaydb  --from-literal=MYSQL_SUREPAY_DB=jdbc:mysql://192.168.69.22:3306/surepay_data
oc apply configmap mysqlpassword  --from-literal=MYSQL_PASSWORD=xWTp29CW

echo 'Image stream creation started ...'
oc apply -f image-stream-config.yml
