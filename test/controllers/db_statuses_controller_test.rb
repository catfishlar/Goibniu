require 'test_helper'

class DbStatusesControllerTest < ActionController::TestCase
  setup do
    @db_status = db_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:db_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create db_status" do
    assert_difference('DbStatus.count') do
      post :create, db_status: { database_id: @db_status.database_id, note: @db_status.note, request_date: @db_status.request_date }
    end

    assert_redirected_to db_status_path(assigns(:db_status))
  end

  test "should show db_status" do
    get :show, id: @db_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @db_status
    assert_response :success
  end

  test "should update db_status" do
    patch :update, id: @db_status, db_status: { database_id: @db_status.database_id, note: @db_status.note, request_date: @db_status.request_date }
    assert_redirected_to db_status_path(assigns(:db_status))
  end

  test "should destroy db_status" do
    assert_difference('DbStatus.count', -1) do
      delete :destroy, id: @db_status
    end

    assert_redirected_to db_statuses_path
  end
end
