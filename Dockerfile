FROM ruby:3.0.6

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /interviewapp
COPY Gemfile /interviewapp/Gemfile
COPY Gemfile.lock /interviewapp/Gemfile.lock
RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
