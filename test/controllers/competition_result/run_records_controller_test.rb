require 'test_helper'

class CompetitionResult::RunRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get competition_result_run_records_new_url
    assert_response :success
  end

end
