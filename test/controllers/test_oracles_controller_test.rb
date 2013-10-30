require 'test_helper'

class TestOraclesControllerTest < ActionController::TestCase
  setup do
    @test_oracle = test_oracles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_oracles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_oracle" do
    assert_difference('TestOracle.count') do
      post :create, test_oracle: { content: @test_oracle.content }
    end

    assert_redirected_to test_oracle_path(assigns(:test_oracle))
  end

  test "should show test_oracle" do
    get :show, id: @test_oracle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_oracle
    assert_response :success
  end

  test "should update test_oracle" do
    patch :update, id: @test_oracle, test_oracle: { content: @test_oracle.content }
    assert_redirected_to test_oracle_path(assigns(:test_oracle))
  end

  test "should destroy test_oracle" do
    assert_difference('TestOracle.count', -1) do
      delete :destroy, id: @test_oracle
    end

    assert_redirected_to test_oracles_path
  end
end
