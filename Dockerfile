FROM ruby:3.2

# 必要なツールのインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn postgresql-client


# アプリケーションディレクトリの作成
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile Gemfile.lock /app/

# Bundlerのインストールと依存関係の解決
RUN gem install bundler && bundle install

# アプリケーションファイルをコピー
COPY . /app/
