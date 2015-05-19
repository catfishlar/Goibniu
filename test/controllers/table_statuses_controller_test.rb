require 'test_helper'

class TableStatusesControllerTest < ActionController::TestCase
  setup do
    @table_status = table_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:table_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create table_status" do
    assert_difference('TableStatus.count') do
      post :create, table_status: { auto_increment: @table_status.auto_increment, avg_row_length: @table_status.avg_row_length, check_time: @table_status.check_time, checksum: @table_status.checksum, collation: @table_status.collation, comment: @table_status.comment, create_options: @table_status.create_options, create_time: @table_status.create_time, data_free: @table_status.data_free, data_length: @table_status.data_length, db_status_id: @table_status.db_status_id, engine: @table_status.engine, index_length: @table_status.index_length, max_data_length: @table_status.max_data_length, name: @table_status.name, row_format: @table_status.row_format, rows: @table_status.rows, update_time: @table_status.update_time, version: @table_status.version }
    end

    assert_redirected_to table_status_path(assigns(:table_status))
  end

  test "should show table_status" do
    get :show, id: @table_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @table_status
    assert_response :success
  end

  test "should update table_status" do
    patch :update, id: @table_status, table_status: { auto_increment: @table_status.auto_increment, avg_row_length: @table_status.avg_row_length, check_time: @table_status.check_time, checksum: @table_status.checksum, collation: @table_status.collation, comment: @table_status.comment, create_options: @table_status.create_options, create_time: @table_status.create_time, data_free: @table_status.data_free, data_length: @table_status.data_length, db_status_id: @table_status.db_status_id, engine: @table_status.engine, index_length: @table_status.index_length, max_data_length: @table_status.max_data_length, name: @table_status.name, row_format: @table_status.row_format, rows: @table_status.rows, update_time: @table_status.update_time, version: @table_status.version }
    assert_redirected_to table_status_path(assigns(:table_status))
  end

  test "should destroy table_status" do
    assert_difference('TableStatus.count', -1) do
      delete :destroy, id: @table_status
    end

    assert_redirected_to table_statuses_path
  end
end
