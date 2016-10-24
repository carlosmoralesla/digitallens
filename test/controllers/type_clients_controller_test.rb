require 'test_helper'

class TypeClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_client = type_clients(:one)
  end

  test "should get index" do
    get type_clients_url
    assert_response :success
  end

  test "should get new" do
    get new_type_client_url
    assert_response :success
  end

  test "should create type client" do
    assert_difference('TypeClient.count') do
      post type_clients_url, params: { type_client: { name: @type_client.name } }
    end

    assert_redirected_to type_client_url(TypeClient.last)
  end

  test "should show type_client" do
    get type_client_url(@type_client)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_client_url(@type_client)
    assert_response :success
  end

  test "should update type_client" do
    patch type_client_url(@type_client), params: { type_client: { name: @type_client.name } }
    assert_redirected_to type_client_url(@type_client)
  end

  test "should destroy type_client" do
    assert_difference('TypeClient.count', -1) do
      delete type_client_url(@type_client)
    end

    assert_redirected_to suppliers_url
  end
end
