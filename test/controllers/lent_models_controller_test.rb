require 'test_helper'

class LentModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lent_model = lent_models(:one)
  end

  test "should get index" do
    get lent_models_url
    assert_response :success
  end

  test "should get new" do
    get new_lent_model_url
    assert_response :success
  end

  test "should create lent_model" do
    assert_difference('LentModel.count') do
      post lent_models_url, params: { lent_model: { lent_mark_id: @lent_model.lent_mark_id, name: @lent_model.name } }
    end

    assert_redirected_to lent_model_url(LentModel.last)
  end

  test "should show lent_model" do
    get lent_model_url(@lent_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_lent_model_url(@lent_model)
    assert_response :success
  end

  test "should update lent_model" do
    patch lent_model_url(@lent_model), params: { lent_model: { lent_mark_id: @lent_model.lent_mark_id, name: @lent_model.name } }
    assert_redirected_to lent_model_url(@lent_model)
  end

  test "should destroy lent_model" do
    assert_difference('LentModel.count', -1) do
      delete lent_model_url(@lent_model)
    end

    assert_redirected_to lent_models_url
  end
end
