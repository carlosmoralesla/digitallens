require 'test_helper'

class LentMarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lent_mark = lent_marks(:one)
  end

  test "should get index" do
    get lent_marks_url
    assert_response :success
  end

  test "should get new" do
    get new_lent_mark_url
    assert_response :success
  end

  test "should create lent_mark" do
    assert_difference('LentMark.count') do
      post lent_marks_url, params: { lent_mark: { name: @lent_mark.name } }
    end

    assert_redirected_to lent_mark_url(LentMark.last)
  end

  test "should show lent_mark" do
    get lent_mark_url(@lent_mark)
    assert_response :success
  end

  test "should get edit" do
    get edit_lent_mark_url(@lent_mark)
    assert_response :success
  end

  test "should update lent_mark" do
    patch lent_mark_url(@lent_mark), params: { lent_mark: { name: @lent_mark.name } }
    assert_redirected_to lent_mark_url(@lent_mark)
  end

  test "should destroy lent_mark" do
    assert_difference('LentMark.count', -1) do
      delete lent_mark_url(@lent_mark)
    end

    assert_redirected_to lent_marks_url
  end
end
