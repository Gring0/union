class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Нет прав администратора.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) || not_found
  end

  def edit
    @user = User.find(params[:id])
    if @user.update_attributes(:uuid => params[:uuid], :name => params[:name], :enabled => params[:enabled], :academy_group => params[:academy_group], :card_number => params[:card_number])
      redirect_to root_path, :notice => "Ваши данные обновлены."
    else
      redirect_to root_path, :alert => "Невозможно обновить ваши данные."
    end
  end

  def update
    @user = User.find(params[:id])
    authorize! :update, @user, :message => 'Нет прав администратора.'
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "Данные пользователя обновлены."
    else
      redirect_to users_path, :alert => "Невозможно обновить данные пользователя."
    end
  end

  def destroy
    authorize! :destroy, @user, :message => 'Нет прав администратора.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "Пользователь удалён."
    else
      redirect_to users_path, :notice => "Невозможно удалить самого себя."
    end
  end

end
