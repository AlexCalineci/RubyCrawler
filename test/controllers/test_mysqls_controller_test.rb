require 'test_helper'

class TestMysqlsControllerTest < ActionController::TestCase
  setup do
    @test_mysql = test_mysqls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_mysqls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_mysql" do
    assert_difference('TestMysql.count') do
      post :create, test_mysql: { content: @test_mysql.content }
    end

    assert_redirected_to test_mysql_path(assigns(:test_mysql))
  end

  test "should show test_mysql" do
    get :show, id: @test_mysql
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_mysql
    assert_response :success
  end

  test "should update test_mysql" do
    patch :update, id: @test_mysql, test_mysql: { content: @test_mysql.content }
    assert_redirected_to test_mysql_path(assigns(:test_mysql))
  end

  test "should destroy test_mysql" do
    assert_difference('TestMysql.count', -1) do
      delete :destroy, id: @test_mysql
    end

    assert_redirected_to test_mysqls_path
  end
end
