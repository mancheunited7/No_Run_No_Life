require 'test_helper'

class UserCompSchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_comp_schedule_create_url
    assert_response :success
  end

end
