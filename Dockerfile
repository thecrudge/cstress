FROM ubuntu:bionic

# Install curl, wget, gnupg2
RUN apt-get update && apt-get --assume-yes install curl gnupg2 wget

# Add Cassandra repo
RUN echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list
RUN apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA
RUN wget https://www.apache.org/dist/cassandra/KEYS && apt-key add KEYS 

# Install Cassandra package
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install cassandra cassandra-tools

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]