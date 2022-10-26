# frozen_string_literal: true

class TestData # rubocop:disable Metrics/ClassLength
  def self.card
    {
      'number' => '4242424242424242',
      'expMonth' => '12',
      'expYear' => '55',
      'cvc' => '123',
      'cardholderName' => random_string,
    }.compact
  end

  def self.disputed_card
    {
      'number' => '4242000000000018',
      'expMonth' => '12',
      'expYear' => '55',
      'cvc' => '123',
      'cardholderName' => random_string,
    }.compact
  end

  def self.fraud_warning_card
    {
      'number' => '4242000000000208',
      'expMonth' => '12',
      'expYear' => '55',
      'cvc' => '123',
      'cardholderName' => random_string,
    }.compact
  end

  def self.charge(
    card: nil,
    customer_id: nil,
    captured: nil
  )
    {
      'amount' => 1000,
      'captured' => captured,
      'currency' => 'EUR',
      'description' => 'description',
      'card' => card,
      'customerId' => customer_id,
      'metadata' => { 'key' => 'value' },
    }.compact
  end

  def self.credit(
    card: nil,
    customer_id: nil
  )
    {
      'amount' => 1000,
      'currency' => 'EUR',
      'description' => 'description',
      'card' => card,
      'customerId' => customer_id,
      'metadata' => { 'key' => 'value' },
    }.compact
  end

  def self.customer(
    card: nil,
    email: random_email
  )
    {
      'email' => email,
      'card' => card,
    }.compact
  end

  def self.cross_sale_offer_with_charge
    {
      'charge' => {
        'amount' => 1000,
        'currency' => 'EUR',
      },
      'title' => 'Test Title',
      'description' => 'Test Description',
      'termsAndConditionsUrl' => 'https://github.com/securionpay',
      'template' => 'text_only',
      'companyName' => 'SecurionPay Tests',
      'companyLocation' => 'CH',
    }.compact
  end

  def self.plan(
    amount: 1000,
    currency: 'EUR',
    interval: 'month',
    name: "Plan: #{random_string}"
  )
    {
      'amount' => amount,
      'currency' => currency,
      'interval' => interval,
      'name' => name,
    }.compact
  end

  def self.payment_method(
    customer_id: nil
  )
    {
      'type' => 'alipay',
      'customerId' => customer_id,
      'billing' => {
        'name' => 'Nikola Tesla'
      }.compact
    }.compact
  end
end
