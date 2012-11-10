require 'test_helper'

class SiteshipsControllerTest < ActionController::TestCase
  setup do
    @siteship = siteships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:siteships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create siteship" do
    assert_difference('Siteship.count') do
      post :create, siteship: { site_id: @siteship.site_id, user_id: @siteship.user_id }
    end

    assert_redirected_to siteship_path(assigns(:siteship))
  end

  test "should show siteship" do
    get :show, id: @siteship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @siteship
    assert_response :success
  end

  test "should update siteship" do
    put :update, id: @siteship, siteship: { site_id: @siteship.site_id, user_id: @siteship.user_id }
    assert_redirected_to siteship_path(assigns(:siteship))
  end

  test "should destroy siteship" do
    assert_difference('Siteship.count', -1) do
      delete :destroy, id: @siteship
    end

    assert_redirected_to siteships_path
  end
end
