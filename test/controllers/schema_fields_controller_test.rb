require 'test_helper'

class SchemaFieldsControllerTest < ActionController::TestCase
  setup do
    @schema_field = schema_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schema_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schema_field" do
    assert_difference('SchemaField.count') do
      post :create, schema_field: { default: @schema_field.default, field_type: @schema_field.field_type, name: @schema_field.name, nullable: @schema_field.nullable, schema_table_id: @schema_field.schema_table_id, type_params: @schema_field.type_params }
    end

    assert_redirected_to schema_field_path(assigns(:schema_field))
  end

  test "should show schema_field" do
    get :show, id: @schema_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schema_field
    assert_response :success
  end

  test "should update schema_field" do
    patch :update, id: @schema_field, schema_field: { default: @schema_field.default, field_type: @schema_field.field_type, name: @schema_field.name, nullable: @schema_field.nullable, schema_table_id: @schema_field.schema_table_id, type_params: @schema_field.type_params }
    assert_redirected_to schema_field_path(assigns(:schema_field))
  end

  test "should destroy schema_field" do
    assert_difference('SchemaField.count', -1) do
      delete :destroy, id: @schema_field
    end

    assert_redirected_to schema_fields_path
  end
end
