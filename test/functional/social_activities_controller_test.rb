require 'test_helper'

class SocialActivitiesControllerTest < ActionController::TestCase
  setup do
    @social_activity = social_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:social_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create social_activity" do
    assert_difference('SocialActivity.count') do
      post :create, social_activity: {  }
    end

    assert_redirected_to social_activity_path(assigns(:social_activity))
  end

  test "should show social_activity" do
    get :show, id: @social_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @social_activity
    assert_response :success
  end

  test "should update social_activity" do
    put :update, id: @social_activity, social_activity: {  }
    assert_redirected_to social_activity_path(assigns(:social_activity))
  end

  test "should destroy social_activity" do
    assert_difference('SocialActivity.count', -1) do
      delete :destroy, id: @social_activity
    end

    assert_redirected_to social_activities_path
  end
end
