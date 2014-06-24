require 'test_helper'

class Manager::Statuses::ConversationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get activate" do
    get :activate
    assert_response :success
  end

  test "should get deactivate" do
    get :deactivate
    assert_response :success
  end

end
