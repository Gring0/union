class SubsidiesController < ApplicationController
  # GET /subsidies
  # GET /subsidies.json

=begin
  unless user_signed_in?
    redirect_to root_path, flash[:error] => "Пожалуйста, войдите в систему, чтобы продолжить"
  end
=end

  def index
    @subsidies = Subsidy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subsidies }
    end
  end

  # GET /subsidies/1
  # GET /subsidies/1.json
  def show
    @subsidy = Subsidy.find(params[:id])
    @order = @subsidy.order
    @user = @order.user
    @type = @subsidy.subsidy_type
    @basis = @subsidy.basis

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subsidy }
    end
  end

  # GET /subsidies/new
  # GET /subsidies/new.json
  def new
    current_user.update_student_info
    @subsidy = Subsidy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subsidy }
    end
  end

  # GET /subsidies/1/edit
  def edit
    @subsidy = Subsidy.find(params[:id])
  end

  # POST /subsidies
  # POST /subsidies.json
  def create
    @subsidy  = Subsidy.new params[:subsidy]
    if @subsidy.save
      @order = @subsidy.create_order(user_id: current_user.id, current_academy_group: current_user.academy_group, current_student_name: current_user.name )
    end

    respond_to do |format|
      if @subsidy.save
        format.html { redirect_to @subsidy, notice: 'Заявка на материальную выплату успешно создана.' }
        format.json { render json: @subsidy, status: :created, location: @subsidy }
      else
        format.html { render action: "new" }
        format.json { render json: @subsidy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subsidies/1
  # PUT /subsidies/1.json
  def update
    @subsidy = Subsidy.find(params[:id])

    respond_to do |format|
      if @subsidy.update_attributes(params[:subsidy])
        format.html { redirect_to @subsidy, notice: 'Заявка на материальную выплату успешно обновлена.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subsidy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subsidies/1
  # DELETE /subsidies/1.json
  def destroy
    @subsidy = Subsidy.find(params[:id])
    @subsidy.destroy

    respond_to do |format|
      format.html { redirect_to subsidies_url }
      format.json { head :no_content }
    end
  end
end
