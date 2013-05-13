class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def not_found
    render :text => "404 Not Found", :status => 404 # TODO Сделать стандартную 404 страницу
  end

  def authenticate_admin_user!
    redirect_to new_user_session_path unless (!current_user.nil? and (current_user.has_role? :admin))
  end

  def current_admin_user
    return nil if user_signed_in? && !(current_user.has_role? :admin)
    current_user
  end
end