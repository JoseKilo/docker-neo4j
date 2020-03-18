FROM java:7-jdk

# Install Neo4j 2.2.10
RUN cd /tmp && \
    wget http://dist.neo4j.org/neo4j-community-2.2.10-unix.tar.gz && \
    tar xzvf neo4j-community-2.2.10-unix.tar.gz && \
    mv /tmp/neo4j-community-2.2.10/ /neo4j

# Configure Neo4j
RUN sed -e 's/#allow_store_upgrade=.*$/allow_store_upgrade=true/' -i /neo4j/conf/neo4j.properties && \
    sed -e 's/^org.neo4j.server.database.location=.*$/org.neo4j.server.database.location=\/data/' -i /neo4j/conf/neo4j-server.properties && \
    sed -e 's/^#org.neo4j.server.webserver.address=.*$/org.neo4j.server.webserver.address=0.0.0.0/' -i /neo4j/conf/neo4j-server.properties

# Cleaning up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add scripts
ADD scripts /scripts
RUN chmod +x /scripts/*.sh

# Command to run
ENTRYPOINT ["/scripts/run.sh"]
CMD [""]

# Expose listen port
EXPOSE 7474

# Expose our data volumes
VOLUME ["/data"]
