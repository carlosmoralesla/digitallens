require 'test_helper'

class TypeDocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_doc = type_docs(:one)
  end

  test "should get index" do
    get type_docs_url
    assert_response :success
  end

  test "should get new" do
    get new_type_doc_url
    assert_response :success
  end

  test "should create type_doc" do
    assert_difference('TypeDoc.count') do
      post type_docs_url, params: { type_doc: { name: @type_doc.name, type_account_id: @type_doc.type_account_id } }
    end

    assert_redirected_to type_doc_url(TypeDoc.last)
  end

  test "should show type_doc" do
    get type_doc_url(@type_doc)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_doc_url(@type_doc)
    assert_response :success
  end

  test "should update type_doc" do
    patch type_doc_url(@type_doc), params: { type_doc: { name: @type_doc.name, type_account_id: @type_doc.type_account_id } }
    assert_redirected_to type_doc_url(@type_doc)
  end

  test "should destroy type_doc" do
    assert_difference('TypeDoc.count', -1) do
      delete type_doc_url(@type_doc)
    end

    assert_redirected_to type_docs_url
  end
end
