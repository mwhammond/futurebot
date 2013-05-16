require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get pipeline" do
    get :pipeline
    assert_response :success
  end

end
