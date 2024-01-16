FROM ubuntu:22.04
RUN apt-get update
RUN apt-cache policy ruby3.0
RUN apt-get update \
    && apt-get install -y ruby-full ruby-dev build-essential
RUN apt-get install rubygems-integration
RUN gem install bundler
ENV APP_HOME /app
RUN mkdir $APP_HOME

WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle install
ADD . $APP_HOME

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
