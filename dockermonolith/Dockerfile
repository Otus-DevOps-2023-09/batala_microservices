FROM ubuntu:18.04
COPY start.sh /start.sh
RUN apt-get update && apt-get install -y \
    mongodb-server \
    ruby-full \
    ruby-dev \
    build-essential \
    git \
    ruby-bundler && \
    chmod 0777 /start.sh && \
    git clone -b monolith https://github.com/express42/reddit.git && \
    cd /reddit && rm Gemfile.lock && bundle install && \
    apt-get clean
COPY mongod.conf /etc/mongod.conf
COPY db_config /reddit/db_config


RUN cd /reddit && rm Gemfile.lock && bundle install
RUN chmod 0777 /start.sh

CMD ["/start.sh"]
