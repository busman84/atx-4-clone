require 'test_helper'

class CorgisControllerTest < ActionController::TestCase
  setup do
    @corgi = corgis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:corgis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create corgi" do
    assert_difference('Corgi.count') do
      post :create, corgi: { age: @corgi.age, name: @corgi.name, user_id: @corgi.user_id }
    end

    assert_redirected_to corgi_path(assigns(:corgi))
  end

  test "should show corgi" do
    get :show, id: @corgi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @corgi
    assert_response :success
  end

  test "should update corgi" do
    patch :update, id: @corgi, corgi: { age: @corgi.age, name: @corgi.name, user_id: @corgi.user_id }
    assert_redirected_to corgi_path(assigns(:corgi))
  end

  test "should destroy corgi" do
    assert_difference('Corgi.count', -1) do
      delete :destroy, id: @corgi
    end

    assert_redirected_to corgis_path
  end
end
