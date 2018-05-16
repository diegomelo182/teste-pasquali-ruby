require 'test_helper'

class ContributionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contribution = contributions(:one)
  end

  test "should get index" do
    get contributions_url, as: :json
    assert_response :success
  end

  test "should create contribution" do
    assert_difference('Contribution.count') do
      post contributions_url, params: { contribution: { account_id: @contribution.account_id, amount: @contribution.amount } }, as: :json
    end

    assert_response 201
  end

  test "should show contribution" do
    get contribution_url(@contribution), as: :json
    assert_response :success
  end

  test "should update contribution" do
    patch contribution_url(@contribution), params: { contribution: { account_id: @contribution.account_id, amount: @contribution.amount } }, as: :json
    assert_response 200
  end

  test "should destroy contribution" do
    assert_difference('Contribution.count', -1) do
      delete contribution_url(@contribution), as: :json
    end

    assert_response 204
  end
end
