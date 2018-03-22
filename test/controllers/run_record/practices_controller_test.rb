require 'test_helper'

class RunRecord::PracticesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get run_record_practices_new_url
    assert_response :success
  end

end
