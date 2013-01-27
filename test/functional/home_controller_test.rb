require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get vission" do
    get :vission
    assert_response :success
  end

  test "should get mission" do
    get :mission
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get services" do
    get :services
    assert_response :success
  end

  test "should get who" do
    get :who
    assert_response :success
  end

end
