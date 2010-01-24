require 'test_helper'

class CarparkTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Carpark.new.valid?
  end
end
