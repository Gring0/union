class HomeController < ApplicationController
  def index
    @order = Order.new
    @users = User.all
  end
end
