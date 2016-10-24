require 'test_helper'

class LentTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lent_type = lent_types(:one)
  end

  test "should get index" do
    get lent_types_url
    assert_response :success
  end

  test "should get new" do
    get new_lent_type_url
    assert_response :success
  end

  test "should create lent_type" do
    assert_difference('LentType.count') do
      post lent_types_url, params: { lent_type: { name: @lent_type.name } }
    end

    assert_redirected_to lent_type_url(LentType.last)
  end

  test "should show lent_type" do
    get lent_type_url(@lent_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_lent_type_url(@lent_type)
    assert_response :success
  end

  test "should update lent_type" do
    patch lent_type_url(@lent_type), params: { lent_type: { name: @lent_type.name } }
    assert_redirected_to lent_type_url(@lent_type)
  end

  test "should destroy lent_type" do
    assert_difference('LentType.count', -1) do
      delete lent_type_url(@lent_type)
    end

    assert_redirected_to lent_types_url
  end
end
