FROM docker.wso2.com/wso2mi:1.1.0.1595439317444.2-alpine3.10

RUN mkdir -p /home/wso2carbon/wso2-config-volume
RUN mkdir -p /home/wso2carbon/wso2-artifact-volume

COPY axis2.xml /home/wso2carbon/wso2-config-volume/conf/axis2

# start WSO2 Carbon server
sh ${WSO2_SERVER_HOME}/bin/micro-integrator.sh "$@"
