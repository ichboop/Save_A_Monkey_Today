require 'test_helper'

class GetawaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get getaways_index_url
    assert_response :success
  end

  test "should get show" do
    get getaways_show_url
    assert_response :success
  end

  test "should get new" do
    get getaways_new_url
    assert_response :success
  end

  test "should get create" do
    get getaways_create_url
    assert_response :success
  end

end
