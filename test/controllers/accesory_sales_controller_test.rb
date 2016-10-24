require 'test_helper'

class AccesorySalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accesory_sale = accesory_sales(:one)
  end

  test "should get index" do
    get accesory_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_accesory_sale_url
    assert_response :success
  end

  test "should create accesory_sale" do
    assert_difference('AccesorySale.count') do
      post accesory_sales_url, params: { accesory_sale: { price_sale: @accesory_sale.price_sale, quantity: @accesory_sale.quantity, sale_id: @accesory_sale.sale_id } }
    end

    assert_redirected_to accesory_sale_url(AccesorySale.last)
  end

  test "should show accesory_sale" do
    get accesory_sale_url(@accesory_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_accesory_sale_url(@accesory_sale)
    assert_response :success
  end

  test "should update accesory_sale" do
    patch accesory_sale_url(@accesory_sale), params: { accesory_sale: { price_sale: @accesory_sale.price_sale, quantity: @accesory_sale.quantity, sale_id: @accesory_sale.sale_id } }
    assert_redirected_to accesory_sale_url(@accesory_sale)
  end

  test "should destroy accesory_sale" do
    assert_difference('AccesorySale.count', -1) do
      delete accesory_sale_url(@accesory_sale)
    end

    assert_redirected_to accesory_sales_url
  end
end
