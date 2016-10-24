require 'test_helper'

class MontureTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monture_type = monture_types(:one)
  end

  test "should get index" do
    get monture_types_url
    assert_response :success
  end

  test "should get new" do
    get new_monture_type_url
    assert_response :success
  end

  test "should create monture_type" do
    assert_difference('MontureType.count') do
      post monture_types_url, params: { monture_type: { name: @monture_type.name } }
    end

    assert_redirected_to monture_type_url(MontureType.last)
  end

  test "should show monture_type" do
    get monture_type_url(@monture_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_monture_type_url(@monture_type)
    assert_response :success
  end

  test "should update monture_type" do
    patch monture_type_url(@monture_type), params: { monture_type: { name: @monture_type.name } }
    assert_redirected_to monture_type_url(@monture_type)
  end

  test "should destroy monture_type" do
    assert_difference('MontureType.count', -1) do
      delete monture_type_url(@monture_type)
    end

    assert_redirected_to monture_types_url
  end
end
