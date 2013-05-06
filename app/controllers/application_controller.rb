class ApplicationController < ActionController::Base
  include TheRole::Requires

  protect_from_forgery

  def access_denied
    render :text => 'access_denied: requires an role' and return
  end

  alias_method :login_required,     :authenticate_user!
  alias_method :role_access_denied, :access_denied

  # private methods (should be define as before filters)
  #the_role_access_denied
  #the_role_object
  #the_role_require
  #the_owner_require
end
