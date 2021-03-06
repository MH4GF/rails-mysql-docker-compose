FROM ruby:2.7.1

ENV LANG C.UTF-8
ENV TZ=Asia/Tokyo
EXPOSE 3000

WORKDIR /app

# nodejs, yarnをインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn

COPY . .
RUN bundle install
RUN yarn install

# rails serverはdocker-compose.ymlで起動する
