require 'test_helper'

class PropertySearchTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PropertySearch.new.valid?
  end
end
