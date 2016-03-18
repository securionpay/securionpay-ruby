require 'test_helper'

class Securionpay::RubyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Securionpay::Ruby::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_it_does_not_something_useful
    assert true
  end
end
