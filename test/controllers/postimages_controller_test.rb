require "test_helper"

class PostimagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get postimages_new_url
    assert_response :success
  end

  test "should get index" do
    get postimages_index_url
    assert_response :success
  end

  test "should get create" do
    get postimages_create_url
    assert_response :success
  end
end
