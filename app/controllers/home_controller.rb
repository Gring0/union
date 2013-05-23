class HomeController < ApplicationController
  def index
    def not_student
      flash[:error] = "Вы не можете подать заявление, потому что ваш профиль не связан с «Электронным Университетом»"
    end

    def not_allowed
      flash[:error] = "Вы не можете подать заявление. Возможно, вы учитесь на платной форме или уже совсем не учитесь в МГТУ им. Н. Э. Баумана."
    end

    not_student if current_user and !current_user.has_role? :student
    not_allowed if current_user and !current_user.is_allowed?
  end
end
