FROM docker.wso2.com/wso2mi:1.1.0.1595439317444.2-alpine3.10

RUN  cd /home/wso2carbon/wso2mi-1.1.0/repository/deployment/server/carbonapps && wget http://tapp488lv.corp.telma.mg:8081/repository/maven-snapshots/com/axian/logger/logger-1.0.0-SNAPSHOT/logger-1.0.0-SNAPSHOT-.car
RUN  cd /home/wso2carbon/wso2mi-1.1.0/repository/deployment/server/carbonapps && wget http://tapp488lv.corp.telma.mg:8081/repository/axian-snapshots/com/axian/account-management/account-management-1.0.0-SNAPSHOT/account-management-1.0.0-SNAPSHOT-.car

RUN mkdir -p /home/wso2carbon/wso2-config-volume
RUN mkdir -p /home/wso2carbon/wso2-artifact-volume

RUN /bin/chown -R wso2carbon:wso2 /home/wso2carbon/wso2-config-volume
RUN /bin/chown -R wso2carbon:wso2 /home/wso2carbon/wso2-artifact-volume
