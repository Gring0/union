require 'test_helper'

class TransportSubsidiesControllerTest < ActionController::TestCase
  setup do
    @transport_subsidy = transport_subsidies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transport_subsidies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transport_subsidy" do
    assert_difference('TransportSubsidy.count') do
      post :create, transport_subsidy: { arrival: @transport_subsidy.arrival, departure: @transport_subsidy.departure }
    end

    assert_redirected_to transport_subsidy_path(assigns(:transport_subsidy))
  end

  test "should show transport_subsidy" do
    get :show, id: @transport_subsidy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transport_subsidy
    assert_response :success
  end

  test "should update transport_subsidy" do
    put :update, id: @transport_subsidy, transport_subsidy: { arrival: @transport_subsidy.arrival, departure: @transport_subsidy.departure }
    assert_redirected_to transport_subsidy_path(assigns(:transport_subsidy))
  end

  test "should destroy transport_subsidy" do
    assert_difference('TransportSubsidy.count', -1) do
      delete :destroy, id: @transport_subsidy
    end

    assert_redirected_to transport_subsidies_path
  end
end
