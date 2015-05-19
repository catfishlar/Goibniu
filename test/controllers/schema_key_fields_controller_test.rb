require 'test_helper'

class SchemaKeyFieldsControllerTest < ActionController::TestCase
  setup do
    @schema_key_field = schema_key_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schema_key_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schema_key_field" do
    assert_difference('SchemaKeyField.count') do
      post :create, schema_key_field: { name: @schema_key_field.name, order: @schema_key_field.order, schema_key_id: @schema_key_field.schema_key_id }
    end

    assert_redirected_to schema_key_field_path(assigns(:schema_key_field))
  end

  test "should show schema_key_field" do
    get :show, id: @schema_key_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schema_key_field
    assert_response :success
  end

  test "should update schema_key_field" do
    patch :update, id: @schema_key_field, schema_key_field: { name: @schema_key_field.name, order: @schema_key_field.order, schema_key_id: @schema_key_field.schema_key_id }
    assert_redirected_to schema_key_field_path(assigns(:schema_key_field))
  end

  test "should destroy schema_key_field" do
    assert_difference('SchemaKeyField.count', -1) do
      delete :destroy, id: @schema_key_field
    end

    assert_redirected_to schema_key_fields_path
  end
end
