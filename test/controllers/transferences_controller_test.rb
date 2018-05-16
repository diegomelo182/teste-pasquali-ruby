require 'test_helper'

class TransferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transference = transferences(:one)
  end

  test "should get index" do
    get transferences_url, as: :json
    assert_response :success
  end

  test "should create transference" do
    assert_difference('Transference.count') do
      post transferences_url, params: { transference: { amount: @transference.amount, receiver_account_id: @transference.receiver_account_id, sender_account_id: @transference.sender_account_id } }, as: :json
    end

    assert_response 201
  end

  test "should show transference" do
    get transference_url(@transference), as: :json
    assert_response :success
  end

  test "should update transference" do
    patch transference_url(@transference), params: { transference: { amount: @transference.amount, receiver_account_id: @transference.receiver_account_id, sender_account_id: @transference.sender_account_id } }, as: :json
    assert_response 200
  end

  test "should destroy transference" do
    assert_difference('Transference.count', -1) do
      delete transference_url(@transference), as: :json
    end

    assert_response 204
  end
end
