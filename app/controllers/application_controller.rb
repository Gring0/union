class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def not_found
    render :text => "404 Not Found", :status => 404 # TODO Сделать стандартную 404 страницу
  end
end