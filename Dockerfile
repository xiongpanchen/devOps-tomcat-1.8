FROM registry.cn-beijing.aliyuncs.com/neucloud/webserver30-tomcat8-openshift
MAINTAINER cxp

#添加加密文件包(说明build时当前文件夹下须有这2个文件)
ADD local_policy.jar  /usr/lib/jvm/jre-1.8.0/lib/security/
ADD US_export_policy.jar  /usr/lib/jvm/jre-1.8.0/lib/security/

#切换用户
USER root
#时区修正
ADD localtime /etc/localtime
RUN echo "Asia/shanghai" > /etc/timezone

#容器运行时监听的端口
EXPOSE 8080 22 
#WORKDIR /usr/local/apache-tomcat-8.0.33/bin 
CMD ["/opt/webserver/bin/catalina.sh", "run"]

