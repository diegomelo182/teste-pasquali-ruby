FROM ruby:2.4.1
RUN mkdir /myapp
WORKDIR /myapp
COPY ./test_pasquali_api/Gemfile /myapp/Gemfile
COPY test_pasquali_api/Gemfile.lock /myapp/Gemfile.lock
RUN apt-get update && \
    apt-get install -y mysql-client build-essential libpq-dev nodejs && \
    bundle install
COPY ./test_pasquali_api /myapp
