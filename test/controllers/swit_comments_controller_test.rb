require 'test_helper'

class SwitCommentsControllerTest < ActionController::TestCase
  setup do
    @swit_comment = swit_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swit_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swit_comment" do
    assert_difference('SwitComment.count') do
      post :create, swit_comment: { comment: @swit_comment.comment, swit_id: @swit_comment.swit_id, user_id: @swit_comment.user_id }
    end

    assert_redirected_to swit_comment_path(assigns(:swit_comment))
  end

  test "should show swit_comment" do
    get :show, id: @swit_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swit_comment
    assert_response :success
  end

  test "should update swit_comment" do
    patch :update, id: @swit_comment, swit_comment: { comment: @swit_comment.comment, swit_id: @swit_comment.swit_id, user_id: @swit_comment.user_id }
    assert_redirected_to swit_comment_path(assigns(:swit_comment))
  end

  test "should destroy swit_comment" do
    assert_difference('SwitComment.count', -1) do
      delete :destroy, id: @swit_comment
    end

    assert_redirected_to swit_comments_path
  end
end
