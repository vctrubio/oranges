require 'test_helper'

class LandlordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get landlords_index_url
    assert_response :success
  end

  test "should get show" do
    get landlords_show_url
    assert_response :success
  end

  test "should get new" do
    get landlords_new_url
    assert_response :success
  end

  test "should get edit" do
    get landlords_edit_url
    assert_response :success
  end

end
