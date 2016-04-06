# Securionpay ruby gem

[![Build Status](https://travis-ci.org/gwilczynski/securionpay-ruby.svg?branch=master)](https://travis-ci.org/gwilczynski/securionpay-ruby)
[![Code Climate](https://codeclimate.com/github/gwilczynski/securionpay-ruby/badges/gpa.svg)](https://codeclimate.com/github/gwilczynski/securionpay-ruby)
[![Test Coverage](https://codeclimate.com/github/gwilczynski/securionpay-ruby/badges/coverage.svg)](https://codeclimate.com/github/gwilczynski/securionpay-ruby/coverage)
[![Issue Count](https://codeclimate.com/github/gwilczynski/securionpay-ruby/badges/issue_count.svg)](https://codeclimate.com/github/gwilczynski/securionpay-ruby)
[![Dependency Status](https://gemnasium.com/badges/github.com/gwilczynski/securionpay-ruby.svg)](https://gemnasium.com/github.com/gwilczynski/securionpay-ruby)

If you don't already have SecurionPay account you can create it [here](https://securionpay.com/register).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'securionpay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install securionpay

## Usage

Example:

```ruby
configuration = Securionpay::Configuration.new(secret_key)
processor = Securionpay::Processor.new(configuration)

card = Securionpay::Models::Card.new.tap do |card|
  card.id = 'card_id'
  card.customer_id = 'cust_id'
end

request = Securionpay::Request.new.tap do |request|
  request.type = :retrieve
  request.payload = card
end

processor.process(request)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/securionpay/securionpay-ruby
