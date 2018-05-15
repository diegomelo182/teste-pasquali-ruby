FROM ruby:2.4.1
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN apt-get update && \
    apt-get install -y mysql-client build-essential libpq-dev nodejs && \
    bundle install
COPY . /myapp
