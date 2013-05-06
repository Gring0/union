require 'test_helper'

class SubsidiesControllerTest < ActionController::TestCase
  setup do
    @subsidy = subsidies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subsidies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subsidy" do
    assert_difference('Subsidy.count') do
      post :create, subsidy: {  }
    end

    assert_redirected_to subsidy_path(assigns(:subsidy))
  end

  test "should show subsidy" do
    get :show, id: @subsidy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subsidy
    assert_response :success
  end

  test "should update subsidy" do
    put :update, id: @subsidy, subsidy: {  }
    assert_redirected_to subsidy_path(assigns(:subsidy))
  end

  test "should destroy subsidy" do
    assert_difference('Subsidy.count', -1) do
      delete :destroy, id: @subsidy
    end

    assert_redirected_to subsidies_path
  end
end
