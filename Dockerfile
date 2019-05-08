FROM starefossen/ruby-node:latest

# setup the app
RUN mkdir /app
WORKDIR /app
COPY . /app

# setup bundler
ENV BUNDLE_PATH=/bundle
ENV BUNDLE_BIN=/bundle/bin
ENV GEM_HOME=/bundle
ENV PATH="./bin:/bundle/bin:${PATH}"

# install rails so we have the rails new command
RUN gem install rails
