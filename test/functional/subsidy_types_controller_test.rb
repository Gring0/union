require 'test_helper'

class SubsidyTypesControllerTest < ActionController::TestCase
  setup do
    @subsidy_type = subsidy_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subsidy_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subsidy_type" do
    assert_difference('SubsidyType.count') do
      post :create, subsidy_type: {  }
    end

    assert_redirected_to subsidy_type_path(assigns(:subsidy_type))
  end

  test "should show subsidy_type" do
    get :show, id: @subsidy_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subsidy_type
    assert_response :success
  end

  test "should update subsidy_type" do
    put :update, id: @subsidy_type, subsidy_type: {  }
    assert_redirected_to subsidy_type_path(assigns(:subsidy_type))
  end

  test "should destroy subsidy_type" do
    assert_difference('SubsidyType.count', -1) do
      delete :destroy, id: @subsidy_type
    end

    assert_redirected_to subsidy_types_path
  end
end
