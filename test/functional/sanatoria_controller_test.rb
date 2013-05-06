require 'test_helper'

class SanatoriaControllerTest < ActionController::TestCase
  setup do
    @sanatorium = sanatoria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sanatoria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sanatorium" do
    assert_difference('Sanatorium.count') do
      post :create, sanatorium: {  }
    end

    assert_redirected_to sanatorium_path(assigns(:sanatorium))
  end

  test "should show sanatorium" do
    get :show, id: @sanatorium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sanatorium
    assert_response :success
  end

  test "should update sanatorium" do
    put :update, id: @sanatorium, sanatorium: {  }
    assert_redirected_to sanatorium_path(assigns(:sanatorium))
  end

  test "should destroy sanatorium" do
    assert_difference('Sanatorium.count', -1) do
      delete :destroy, id: @sanatorium
    end

    assert_redirected_to sanatoria_path
  end
end
