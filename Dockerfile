FROM docker.wso2.com/wso2mi:1.1.0.1595439317444.2-alpine3.10

RUN mkdir -p /home/wso2carbon/wso2-config-volume
RUN mkdir -p /home/wso2carbon/wso2-artifact-volume

COPY axis2.xml /home/wso2carbon/wso2-config-volume/conf/axis2

COPY chown -R wso2carbon:wso2 /home/wso2carbon

# expose micro-integrator ports
EXPOSE 8290 8253

# set entrypoint to init script
ENTRYPOINT ["/home/wso2carbon/init.sh"]
