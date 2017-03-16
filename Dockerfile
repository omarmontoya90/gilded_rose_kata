FROM ruby

RUN gem install bundler
RUN mkdir /gilded
WORKDIR /gilded
COPY . /gilded/
RUN bundle
