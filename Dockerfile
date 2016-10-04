FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /src
WORKDIR /src
ADD Gemfile /src/Gemfile
ADD Gemfile.lock /src/Gemfile.lock
RUN bundle install
ADD . /src
