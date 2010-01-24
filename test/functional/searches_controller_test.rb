require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_edit
    get :edit, :id => Search.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Search.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Search.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Search.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Search.first
    assert_redirected_to searches_url
  end
  
  def test_destroy
    search = Search.first
    delete :destroy, :id => search
    assert_redirected_to searches_url
    assert !Search.exists?(search.id)
  end
end
