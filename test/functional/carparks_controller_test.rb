require 'test_helper'

class CarparksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Carpark.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Carpark.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Carpark.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to carpark_url(assigns(:carpark))
  end
  
  def test_edit
    get :edit, :id => Carpark.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Carpark.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Carpark.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Carpark.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Carpark.first
    assert_redirected_to carpark_url(assigns(:carpark))
  end
  
  def test_destroy
    carpark = Carpark.first
    delete :destroy, :id => carpark
    assert_redirected_to carparks_url
    assert !Carpark.exists?(carpark.id)
  end
end
