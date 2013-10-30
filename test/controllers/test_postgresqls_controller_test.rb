require 'test_helper'

class TestPostgresqlsControllerTest < ActionController::TestCase
  setup do
    @test_postgresql = test_postgresqls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_postgresqls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_postgresql" do
    assert_difference('TestPostgresql.count') do
      post :create, test_postgresql: { content: @test_postgresql.content }
    end

    assert_redirected_to test_postgresql_path(assigns(:test_postgresql))
  end

  test "should show test_postgresql" do
    get :show, id: @test_postgresql
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_postgresql
    assert_response :success
  end

  test "should update test_postgresql" do
    patch :update, id: @test_postgresql, test_postgresql: { content: @test_postgresql.content }
    assert_redirected_to test_postgresql_path(assigns(:test_postgresql))
  end

  test "should destroy test_postgresql" do
    assert_difference('TestPostgresql.count', -1) do
      delete :destroy, id: @test_postgresql
    end

    assert_redirected_to test_postgresqls_path
  end
end
