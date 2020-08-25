#!/bin/bash

echo 'WSO2 micro integrator deployment STARTED...'
oc project test-hiflan

#create WSO2 ConfigMaps
echo 'Config maps creation started ...'

oc create configmap backendurlamdocs --from-literal=AmdocsREST=https://192.168.69.2:8643/bus-server/webapi/v0.14/MM/accounts/{uri.var.identifierType}/{uri.var.identifier}
oc create configmap amdocsapikey  --from-literal=AMDOCS_API_KEY=495ec02230764b96a1c1962f08f155d3
oc create configmap amdocsclientid  --from-literal=AMDOCS_CLIENT_ID=2ae426d409aa4b3cae1ef2eeb87a5388
oc create configmap amdocsesbuserencodedcreds  --from-literal=AMDOCS_ESB_USER_ENCODED_CREDS=Y2hha3JheToyMDIw
oc create configmap amdocssetemailrest  --from-literal=AmdocsSetEmailREST=https://192.168.69.2:8643/bus-server/webapi/v0.14/MM/accounts/{uri.var.msisdn}
oc create configmap mysqlpassword  --from-literal=MYSQL_PASSWORD=xWTp29CW
oc create configmap mysqlsurepaydb  --from-literal=MYSQL_SUREPAY_DB=jdbc:mysql://192.168.69.22:3306/surepay_data
oc create configmap mysqlusername  --from-literal=MYSQL_USERNAME=wsodbservice
oc create configmap purchasemanagementgetbalanceotherendpoint  --from-literal=PURCHASE_MANAGEMENT_GET_BALANCE_OTHER_ENDPOINT=https://192.168.69.2:8643/bus-server/webapi/v0.14/MM/accounts/accountid@{uri.var.creditPartyMsisdn}/portfolio
oc create configmap purchasemanagementgetbalanceselfendpoint  --from-literal=PURCHASE_MANAGEMENT_GET_BALANCE_SELF_ENDPOINT=https://192.168.69.2:8643/bus-server/webapi/v0.14/MM/accounts/accountid@self/portfolio
oc create configmap purchasemanagementsurepayendpoint  --from-literal=PURCHASE_MANAGEMENT_SUREPAY_ENDPOINT=http://10.182.16.11:8210/SvcMgr
oc create configmap purchasemanagementtransactionendpoint  --from-literal=PURCHASE_MANAGEMENT_TRANSACTION_ENDPOINT=https://192.168.69.2:8643/bus-server/webapi/v0.14/MM/transactions

echo 'Config map creation completed'

#create Image stream
echo 'Image stream creation started ...'

oc apply -f image-stream-config.yml

echo 'Image stream creation completed'

#echo 'Deleting previous docker image ...'
#oc tag -d wso2-mi:latest

# create mi build
echo 'Image build started ...'

oc create -f build-config.yaml

echo 'Image build completed'
