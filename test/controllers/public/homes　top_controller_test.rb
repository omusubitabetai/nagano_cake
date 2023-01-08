require "test_helper"

class Public::Homes　topControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get public_homes　top_about_url
    assert_response :success
  end
end
