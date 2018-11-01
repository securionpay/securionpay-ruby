# SecurionPay ruby gem

[![Gem Version](https://badge.fury.io/rb/securionpay.svg)](https://badge.fury.io/rb/securionpay)
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

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install securionpay
```

Unit tests:

```bash
$ bundle exec rake spec:unit
```

Integration tests:

```bash
$ SECRET_KEY='pr_test_id' bundle exec rake spec:integration
```

Mutation tests:

```bash
$ SPEC_OPTS="--pattern spec/unit/**/*_spec.rb" bundle exec mutant --include lib --require securionpay --use rspec SecurionPay*
```

## Usage

Configuration:

```ruby
SecurionPay::Configuration.secret_key = 'pr_test_id'
```

If you want connect do different backend:

```ruby
SecurionPay::Configuration.service_url = 'https://api.chuck.norris.com'
```

### Create a new Card
Creates a new card object.

```ruby
customer_id = 'cust_id'
card = {
  number: '4242424242424242',
  expMonth: '11',
  expYear: '2022',
  cvc: '123',
  cardholderName: 'John Doe',
}

SecurionPay::Cards.create(customer_id, card)
```

### Retrieve an existing Card

Retrieve an existing card object.

```ruby
customer_id = 'cust_id'
card_id = 'card_id'

SecurionPay::Cards.retrieve(customer_id, card_id)
```

### Update an existing Card

Update an existing card object.

```ruby
customer_id = 'cust_id'
card_id = 'card_id'
card = {
  cardholderName: 'Mr Bean'
}
SecurionPay::Cards.update(customer_id, card_id, card)
```

### Delete a Card

Deletes an existing card object.

```ruby
customer_id = 'cust_id'
card_id = 'card_id'
SecurionPay::Cards.delete(customer_id, card_id)
```

### List Cards

List card objects for given customer.

```ruby
customer_id = 'cust_id'
SecurionPay::Cards.list(customer_id)
```

### Create a Blacklist Rule

```ruby
blacklist_rule = {
  ruleType: 'fingerprint',
  fingerprint: '123abc456efg'
}
SecurionPay::Blacklist.create(blacklist_rule)
```

### Retrieve an existing Blacklist Rule

```ruby
blacklist_rule_id = 'blr_number'
SecurionPay::Blacklist.retrieve(blacklist_rule_id)
```

### Delete a Blacklist Rule

```ruby
blacklist_rule_id = 'blr_number'
SecurionPay::Blacklist.delete(blacklist_rule_id)
```

### List Blacklist Rules

```ruby
SecurionPay::Blacklist.list
```

### Create a new Subscription
Creates a new subscription object.

```ruby
customer_id = 'cust_id'
plan = {
  planId: 'some_plan_id',
}

SecurionPay::Subscriptions.create(customer_id, plan)
```

### Retrieve an existing Subscription

Retrieve an existing subscription object.

```ruby
customer_id = 'cust_id'
subscription_id = 'subscription_id'

SecurionPay::Subscriptions.retrieve(customer_id, subscription_id)
```

### Update an existing Subscription

Update an existing subscription object.

```ruby
customer_id = 'cust_id'
subscription_id = 'subscription_id'
plan = {
  planId: 'some_new_plan_id',
}
SecurionPay::Subscriptions.update(customer_id, subscription_id, plan)
```

### Delete an existing Subscription

Delete an existing subscription object.

```ruby
customer_id = 'cust_id'
subscription_id = 'subscription_id'

SecurionPay::Subscriptions.delete(customer_id, subscription_id)
```

### Create a new Plan
Creates a new plan object.

```ruby
plan = {
  amount: 499,
  currency: 'EUR', # three-letter ISO currency code.
  interval: 'day',  # Possible values are: hour, day, week, month, year
  intervalCount: 10, # optional (default is 1)
  name: "Example plan"
}

SecurionPay::Plans.create(plan)
```

### Retrieve an existing Plan

Retrieve an existing plan object.

```ruby
plan_id = 'plan_id'

SecurionPay::Plans.retrieve(plan_id)
```

### Update an existing Plan

Update an existing plan object.

```ruby
plan_id = 'plan_id'
plan = {
    amount: 799,
    currency: 'USD',
}
SecurionPay::Plans.update(plan_id, plan)
```

### Delete an existing Plan

Delete an existing plan object.

```ruby
plan_id = 'plan_id'

SecurionPay::Plans.delete(plan_id)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/securionpay/securionpay-ruby
