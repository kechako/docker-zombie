FROM akiyama/ruby:latest

WORKDIR /app
ADD . /app/

ENTRYPOINT ["ruby", "parent.rb"]
