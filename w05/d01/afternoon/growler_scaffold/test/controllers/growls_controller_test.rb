require 'test_helper'

class GrowlsControllerTest < ActionController::TestCase
  setup do
    @growl = growls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:growls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create growl" do
    assert_difference('Growl.count') do
      post :create, growl: { message: @growl.message }
    end

    assert_redirected_to growl_path(assigns(:growl))
  end

  test "should show growl" do
    get :show, id: @growl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @growl
    assert_response :success
  end

  test "should update growl" do
    patch :update, id: @growl, growl: { message: @growl.message }
    assert_redirected_to growl_path(assigns(:growl))
  end

  test "should destroy growl" do
    assert_difference('Growl.count', -1) do
      delete :destroy, id: @growl
    end

    assert_redirected_to growls_path
  end
end
