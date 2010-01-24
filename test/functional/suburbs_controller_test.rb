require 'test_helper'

class SuburbsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Suburb.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Suburb.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Suburb.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to suburb_url(assigns(:suburb))
  end
  
  def test_edit
    get :edit, :id => Suburb.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Suburb.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Suburb.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Suburb.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Suburb.first
    assert_redirected_to suburb_url(assigns(:suburb))
  end
  
  def test_destroy
    suburb = Suburb.first
    delete :destroy, :id => suburb
    assert_redirected_to suburbs_url
    assert !Suburb.exists?(suburb.id)
  end
end
