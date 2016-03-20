require 'test_helper'

class PushTypesControllerTest < ActionController::TestCase
  setup do
    @push_type = push_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:push_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create push_type" do
    assert_difference('PushType.count') do
      post :create, push_type: { name: @push_type.name }
    end

    assert_redirected_to push_type_path(assigns(:push_type))
  end

  test "should show push_type" do
    get :show, id: @push_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @push_type
    assert_response :success
  end

  test "should update push_type" do
    patch :update, id: @push_type, push_type: { name: @push_type.name }
    assert_redirected_to push_type_path(assigns(:push_type))
  end

  test "should destroy push_type" do
    assert_difference('PushType.count', -1) do
      delete :destroy, id: @push_type
    end

    assert_redirected_to push_types_path
  end
end
