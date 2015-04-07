# Set the base image
FROM debian:wheezy

# File Author / Maintainer
MAINTAINER Daisuke Tanaka, tanaka@infocorpus.com

ENV DEBIAN_FRONTEND noninteractive

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
# RUN groupadd -r cassandra && useradd -r -g cassandra cassandra

RUN apt-get -y update
RUN apt-get install -y curl openssh-client supervisor \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get clean all

# Add DataStax sources
RUN echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/datastax.sources.list
RUN curl -L http://debian.datastax.com/debian/repo_key | apt-key add -

RUN apt-get -y update
RUN apt-get install -y opscenter \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get clean all

# Environment variables
ENV OPSCENTER_CONFIG    /etc/opscenter

# Adding the configuration file
COPY start.sh /start.sh
COPY supervisord.conf /etc/
RUN chmod +x /start.sh

RUN mkdir -p /usr/share/opscenter/tmp

EXPOSE 8888 61620 50031

# Executing sh
ENTRYPOINT ./start.sh