require 'test_helper'

class SwitStatusesControllerTest < ActionController::TestCase
  setup do
    @swit_status = swit_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swit_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swit_status" do
    assert_difference('SwitStatus.count') do
      post :create, swit_status: { status: @swit_status.status, swit_id: @swit_status.swit_id, user_id: @swit_status.user_id }
    end

    assert_redirected_to swit_status_path(assigns(:swit_status))
  end

  test "should show swit_status" do
    get :show, id: @swit_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swit_status
    assert_response :success
  end

  test "should update swit_status" do
    patch :update, id: @swit_status, swit_status: { status: @swit_status.status, swit_id: @swit_status.swit_id, user_id: @swit_status.user_id }
    assert_redirected_to swit_status_path(assigns(:swit_status))
  end

  test "should destroy swit_status" do
    assert_difference('SwitStatus.count', -1) do
      delete :destroy, id: @swit_status
    end

    assert_redirected_to swit_statuses_path
  end
end
