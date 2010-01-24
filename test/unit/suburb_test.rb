require 'test_helper'

class SuburbTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Suburb.new.valid?
  end
end
