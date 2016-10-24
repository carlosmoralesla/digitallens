require 'test_helper'

class InfoSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @info_sale = info_sales(:one)
  end

  test "should get index" do
    get info_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_info_sale_url
    assert_response :success
  end

  test "should create info_sale" do
    assert_difference('InfoSale.count') do
      post info_sales_url, params: { info_sale: { lent_serial_id: @info_sale.lent_serial_id, price_sale: @info_sale.price_sale, quantity: @info_sale.quantity } }
    end

    assert_redirected_to info_sale_url(InfoSale.last)
  end

  test "should show info_sale" do
    get info_sale_url(@info_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_info_sale_url(@info_sale)
    assert_response :success
  end

  test "should update info_sale" do
    patch info_sale_url(@info_sale), params: { info_sale: { lent_serial_id: @info_sale.lent_serial_id, price_sale: @info_sale.price_sale, quantity: @info_sale.quantity } }
    assert_redirected_to info_sale_url(@info_sale)
  end

  test "should destroy info_sale" do
    assert_difference('InfoSale.count', -1) do
      delete info_sale_url(@info_sale)
    end

    assert_redirected_to info_sales_url
  end
end
