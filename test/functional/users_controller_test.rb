require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get plofile" do
    get :plofile
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
