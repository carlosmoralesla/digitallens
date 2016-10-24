require 'test_helper'

class LentKindsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lent_kind = lent_kinds(:one)
  end

  test "should get index" do
    get lent_kinds_url
    assert_response :success
  end

  test "should get new" do
    get new_lent_kind_url
    assert_response :success
  end

  test "should create lent_kind" do
    assert_difference('LentKind.count') do
      post lent_kinds_url, params: { lent_kind: { name: @lent_kind.name } }
    end

    assert_redirected_to lent_kind_url(LentKind.last)
  end

  test "should show lent_kind" do
    get lent_kind_url(@lent_kind)
    assert_response :success
  end

  test "should get edit" do
    get edit_lent_kind_url(@lent_kind)
    assert_response :success
  end

  test "should update lent_kind" do
    patch lent_kind_url(@lent_kind), params: { lent_kind: { name: @lent_kind.name } }
    assert_redirected_to lent_kind_url(@lent_kind)
  end

  test "should destroy lent_kind" do
    assert_difference('LentKind.count', -1) do
      delete lent_kind_url(@lent_kind)
    end

    assert_redirected_to lent_kinds_url
  end
end
