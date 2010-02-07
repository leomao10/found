require 'test_helper'

class PropertySearchesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => PropertySearch.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    PropertySearch.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    PropertySearch.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to property_search_url(assigns(:property_search))
  end
  
  def test_edit
    get :edit, :id => PropertySearch.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    PropertySearch.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PropertySearch.first
    assert_template 'edit'
  end
  
  def test_update_valid
    PropertySearch.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PropertySearch.first
    assert_redirected_to property_search_url(assigns(:property_search))
  end
  
  def test_destroy
    property_search = PropertySearch.first
    delete :destroy, :id => property_search
    assert_redirected_to property_searches_url
    assert !PropertySearch.exists?(property_search.id)
  end
end
