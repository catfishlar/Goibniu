require 'test_helper'

class SchemaKeysControllerTest < ActionController::TestCase
  setup do
    @schema_key = schema_keys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schema_keys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schema_key" do
    assert_difference('SchemaKey.count') do
      post :create, schema_key: { name: @schema_key.name, primary: @schema_key.primary, schema_table_id: @schema_key.schema_table_id, unique: @schema_key.unique }
    end

    assert_redirected_to schema_key_path(assigns(:schema_key))
  end

  test "should show schema_key" do
    get :show, id: @schema_key
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schema_key
    assert_response :success
  end

  test "should update schema_key" do
    patch :update, id: @schema_key, schema_key: { name: @schema_key.name, primary: @schema_key.primary, schema_table_id: @schema_key.schema_table_id, unique: @schema_key.unique }
    assert_redirected_to schema_key_path(assigns(:schema_key))
  end

  test "should destroy schema_key" do
    assert_difference('SchemaKey.count', -1) do
      delete :destroy, id: @schema_key
    end

    assert_redirected_to schema_keys_path
  end
end
