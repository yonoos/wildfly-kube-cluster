FROM jboss/wildfly:13.0.0.Final

LABEL MAINTAINER Younes Chandarli

USER root

COPY docker-entrypoint.sh $JBOSS_HOME/docker-entrypoint.sh
RUN chown jboss $JBOSS_HOME/docker-entrypoint.sh && \
 	chmod a+x $JBOSS_HOME/docker-entrypoint.sh


COPY standalone-ha.xml $JBOSS_HOME/standalone/configuration/
COPY standalone-full-ha.xml $JBOSS_HOME/standalone/configuration/
COPY jee-test.ear.ear $JBOSS_HOME/standalone/deployments/jee-test.ear.ear


EXPOSE 8080 8009 9990 7600 8888

ENTRYPOINT $JBOSS_HOME/docker-entrypoint.sh
