FROM docker.wso2.com/wso2mi:1.1.0.1595439317444.2-alpine3.10

RUN  cd /home/wso2carbon/wso2mi-1.1.0/repository/deployment/server/carbonapps && wget http://tapp488lv.corp.telma.mg:8081/repository/maven-snapshots/com/axian/logger/logger-1.0.0-SNAPSHOT/logger-1.0.0-SNAPSHOT-.car
RUN  cd /home/wso2carbon/wso2mi-1.1.0/repository/deployment/server/carbonapps && wget http://tapp488lv.corp.telma.mg:8081/repository/axian-snapshots/com/axian/account-management/account-management-1.0.0-SNAPSHOT/account-management-1.0.0-SNAPSHOT-.car

COPY micro-integrator.sh /home/wso2carbon/wso2mi-1.1.0/bin
COPY client-truststore.jks /home/wso2carbon/wso2mi-1.1.0/repository/resources/security

COPY axis2.xml /tmp/

