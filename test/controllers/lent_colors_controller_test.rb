require 'test_helper'

class LentColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lent_color = lent_colors(:one)
  end

  test "should get index" do
    get lent_colors_url
    assert_response :success
  end

  test "should get new" do
    get new_lent_color_url
    assert_response :success
  end

  test "should create lent_color" do
    assert_difference('LentColor.count') do
      post lent_colors_url, params: { lent_color: { name: @lent_color.name } }
    end

    assert_redirected_to lent_color_url(LentColor.last)
  end

  test "should show lent_color" do
    get lent_color_url(@lent_color)
    assert_response :success
  end

  test "should get edit" do
    get edit_lent_color_url(@lent_color)
    assert_response :success
  end

  test "should update lent_color" do
    patch lent_color_url(@lent_color), params: { lent_color: { name: @lent_color.name } }
    assert_redirected_to lent_color_url(@lent_color)
  end

  test "should destroy lent_color" do
    assert_difference('LentColor.count', -1) do
      delete lent_color_url(@lent_color)
    end

    assert_redirected_to lent_colors_url
  end
end
