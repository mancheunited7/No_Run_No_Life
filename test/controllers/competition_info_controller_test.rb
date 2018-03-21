require 'test_helper'

class CompetitionInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get competition_info_index_url
    assert_response :success
  end

  test "should get new" do
    get competition_info_new_url
    assert_response :success
  end

  test "should get create" do
    get competition_info_create_url
    assert_response :success
  end

end
