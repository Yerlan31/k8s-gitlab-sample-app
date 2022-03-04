FROM ruby:2.7
WORKDIR /usr/src/
COPY Gemfile* ./
RUN bundle install
COPY db ./db
COPY Rakefile .
COPY server.rb .
CMD ruby server.rb -p 8080
