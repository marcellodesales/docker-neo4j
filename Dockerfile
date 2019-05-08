ARG from_tag=3.4.12
FROM neo4j:$from_tag

COPY ./docker-entrypoint.sh /
COPY ./files/*.jar /var/lib/neo4j/plugins/

RUN chmod 755 /docker-entrypoint.sh && \
    echo 'dbms.security.procedures.unrestricted=algo.*,apoc.*' >> /var/lib/neo4j/conf/neo4j.conf

ENV NEO4J_EDITION community
