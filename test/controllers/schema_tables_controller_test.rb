require 'test_helper'

class SchemaTablesControllerTest < ActionController::TestCase
  setup do
    @schema_table = schema_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schema_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schema_table" do
    assert_difference('SchemaTable.count') do
      post :create, schema_table: { name: @schema_table.name, schema_version_id: @schema_table.schema_version_id }
    end

    assert_redirected_to schema_table_path(assigns(:schema_table))
  end

  test "should show schema_table" do
    get :show, id: @schema_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schema_table
    assert_response :success
  end

  test "should update schema_table" do
    patch :update, id: @schema_table, schema_table: { name: @schema_table.name, schema_version_id: @schema_table.schema_version_id }
    assert_redirected_to schema_table_path(assigns(:schema_table))
  end

  test "should destroy schema_table" do
    assert_difference('SchemaTable.count', -1) do
      delete :destroy, id: @schema_table
    end

    assert_redirected_to schema_tables_path
  end
end
