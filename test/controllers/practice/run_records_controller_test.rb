require 'test_helper'

class Practice::RunRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get practice_run_record_new_url
    assert_response :success
  end

end
