# Set the base image
FROM dtanakax/debianjp:wheezy

# File Author / Maintainer
MAINTAINER Daisuke Tanaka, dtanakax@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get install -y curl openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean all

# Add DataStax sources
RUN echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/datastax.sources.list
RUN curl -L http://debian.datastax.com/debian/repo_key | apt-key add -

ENV OPSCENTER_VERSION 5.1.1

RUN apt-get -y update && \
    apt-get install -y opscenter=${OPSCENTER_VERSION} && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean all

# Environment variables
ENV OPSCENTER_CONFIG    /etc/opscenter
ENV AUTH                false

# Adding the configuration file
COPY start.sh /start.sh
RUN chmod +x /start.sh

RUN mkdir -p /usr/share/opscenter/tmp

ENTRYPOINT ["./start.sh"]

EXPOSE 8888 61620 50031

CMD ["/usr/share/opscenter/bin/opscenter", "-f"]