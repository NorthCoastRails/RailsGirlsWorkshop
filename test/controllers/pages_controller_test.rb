require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get setup_guide" do
    get setup_guide_url
    assert_response :success
  end

  test "should get workshop_steps" do
    get workshop_steps_url
    assert_response :success
  end

  test "should get resources" do
    get resources_url
    assert_response :success
  end

  test "should get index" do
    get root_url
    assert_response :success
  end
end
