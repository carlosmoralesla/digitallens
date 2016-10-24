require 'test_helper'

class LentAccesoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lent_accesory = lent_accesories(:one)
  end

  test "should get index" do
    get lent_accesories_url
    assert_response :success
  end

  test "should get new" do
    get new_lent_accesory_url
    assert_response :success
  end

  test "should create lent_accesory" do
    assert_difference('LentAccesory.count') do
      post lent_accesories_url, params: { lent_accesory: { name: @lent_accesory.name, price_cost: @lent_accesory.price_cost, price_shop: @lent_accesory.price_shop } }
    end

    assert_redirected_to lent_accesory_url(LentAccesory.last)
  end

  test "should show lent_accesory" do
    get lent_accesory_url(@lent_accesory)
    assert_response :success
  end

  test "should get edit" do
    get edit_lent_accesory_url(@lent_accesory)
    assert_response :success
  end

  test "should update lent_accesory" do
    patch lent_accesory_url(@lent_accesory), params: { lent_accesory: { name: @lent_accesory.name, price_cost: @lent_accesory.price_cost, price_shop: @lent_accesory.price_shop } }
    assert_redirected_to lent_accesory_url(@lent_accesory)
  end

  test "should destroy lent_accesory" do
    assert_difference('LentAccesory.count', -1) do
      delete lent_accesory_url(@lent_accesory)
    end

    assert_redirected_to lent_accesories_url
  end
end
