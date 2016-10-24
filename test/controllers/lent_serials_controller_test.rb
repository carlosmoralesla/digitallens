require 'test_helper'

class LentSerialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lent_serial = lent_serials(:one)
  end

  test "should get index" do
    get lent_serials_url
    assert_response :success
  end

  test "should get new" do
    get new_lent_serial_url
    assert_response :success
  end

  test "should create lent_serial" do
    assert_difference('LentSerial.count') do
      post lent_serials_url, params: { lent_serial: { lent_model_id: @lent_serial.lent_model_id, name: @lent_serial.name } }
    end

    assert_redirected_to lent_serial_url(LentSerial.last)
  end

  test "should show lent_serial" do
    get lent_serial_url(@lent_serial)
    assert_response :success
  end

  test "should get edit" do
    get edit_lent_serial_url(@lent_serial)
    assert_response :success
  end

  test "should update lent_serial" do
    patch lent_serial_url(@lent_serial), params: { lent_serial: { lent_model_id: @lent_serial.lent_model_id, name: @lent_serial.name } }
    assert_redirected_to lent_serial_url(@lent_serial)
  end

  test "should destroy lent_serial" do
    assert_difference('LentSerial.count', -1) do
      delete lent_serial_url(@lent_serial)
    end

    assert_redirected_to lent_serials_url
  end
end
