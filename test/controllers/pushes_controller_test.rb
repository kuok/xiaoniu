require 'test_helper'

class PushesControllerTest < ActionController::TestCase
  setup do
    @push = pushes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pushes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create push" do
    assert_difference('Push.count') do
      post :create, push: { competitor_id: @push.competitor_id, content: @push.content, p_date: @push.p_date, type_id: @push.type_id }
    end

    assert_redirected_to push_path(assigns(:push))
  end

  test "should show push" do
    get :show, id: @push
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @push
    assert_response :success
  end

  test "should update push" do
    patch :update, id: @push, push: { competitor_id: @push.competitor_id, content: @push.content, p_date: @push.p_date, type_id: @push.type_id }
    assert_redirected_to push_path(assigns(:push))
  end

  test "should destroy push" do
    assert_difference('Push.count', -1) do
      delete :destroy, id: @push
    end

    assert_redirected_to pushes_path
  end
end
