FROM docker.wso2.com/wso2mi:1.1.0.1595439317444.2-alpine3.10

COPY logger-cap_1.0.0-SNAPSHOT.car /home/wso2carbon/wso2mi-1.1.0/repository/deployment/server/carbonapps
COPY metadatacreator-cap_1.0.0-SNAPSHOT.car /home/wso2carbon/wso2mi-1.1.0/repository/deployment/server/carbonapps
COPY account-management-cap_1.0.0-SNAPSHOT.car /home/wso2carbon/wso2mi-1.1.0/repository/deployment/server/carbonapps

COPY axis2.xml.j2 /home/wso2carbon/wso2mi-1.1.0/repository/resources/conf/templates/conf/axis2
COPY micro-integrator.sh /home/wso2carbon/wso2mi-1.1.0/bin
COPY client-truststore.jks /home/wso2carbon/wso2mi-1.1.0/repository/resources/security

COPY axis2.xml /tmp/

