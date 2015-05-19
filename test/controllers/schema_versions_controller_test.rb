require 'test_helper'

class SchemaVersionsControllerTest < ActionController::TestCase
  setup do
    @schema_version = schema_versions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schema_versions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schema_version" do
    assert_difference('SchemaVersion.count') do
      post :create, schema_version: { comment: @schema_version.comment, mysql_distrib: @schema_version.mysql_distrib, mysql_dump: @schema_version.mysql_dump, schema_id: @schema_version.schema_id, version: @schema_version.version }
    end

    assert_redirected_to schema_version_path(assigns(:schema_version))
  end

  test "should show schema_version" do
    get :show, id: @schema_version
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schema_version
    assert_response :success
  end

  test "should update schema_version" do
    patch :update, id: @schema_version, schema_version: { comment: @schema_version.comment, mysql_distrib: @schema_version.mysql_distrib, mysql_dump: @schema_version.mysql_dump, schema_id: @schema_version.schema_id, version: @schema_version.version }
    assert_redirected_to schema_version_path(assigns(:schema_version))
  end

  test "should destroy schema_version" do
    assert_difference('SchemaVersion.count', -1) do
      delete :destroy, id: @schema_version
    end

    assert_redirected_to schema_versions_path
  end
end
