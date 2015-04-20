# Set the base image
FROM tanaka0323/debianjp:wheezy

# File Author / Maintainer
MAINTAINER Daisuke Tanaka, tanaka@infocorpus.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get install -y curl openssh-client \
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
ENV AUTH                False

# Adding the configuration file
COPY start.sh /start.sh
RUN chmod +x /start.sh

RUN mkdir -p /usr/share/opscenter/tmp

EXPOSE 8888 61620 50031

# Executing sh
ENTRYPOINT ./start.sh