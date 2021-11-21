require "test_helper"

class VillagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get villages_index_url
    assert_response :success
  end
end
