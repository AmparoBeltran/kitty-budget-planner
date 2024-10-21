require "test_helper"

class SummariesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get summaries_show_url
    assert_response :success
  end
end
