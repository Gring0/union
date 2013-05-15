class SubsidyTypesController < ApplicationController
  # GET /subsidy_types
  # GET /subsidy_types.json
  def index
    @subsidy_types = SubsidyType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subsidy_types }
    end
  end

  # GET /subsidy_types/1
  # GET /subsidy_types/1.json
  def show
    @subsidy_type = SubsidyType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subsidy_type }
    end
  end

  # GET /subsidy_types/new
  # GET /subsidy_types/new.json
  def new
    @subsidy_type = SubsidyType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subsidy_type }
    end
  end

  # GET /subsidy_types/1/edit
  def edit
    @subsidy_type = SubsidyType.find(params[:id])
  end

  # POST /subsidy_types
  # POST /subsidy_types.json
  def create
    @subsidy_type = SubsidyType.new(params[:subsidy_type])

    respond_to do |format|
      if @subsidy_type.save
        format.html { redirect_to @subsidy_type, notice: 'Тип материальной выплаты успешно добавлен.' }
        format.json { render json: @subsidy_type, status: :created, location: @subsidy_type }
      else
        format.html { render action: "new" }
        format.json { render json: @subsidy_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subsidy_types/1
  # PUT /subsidy_types/1.json
  def update
    @subsidy_type = SubsidyType.find(params[:id])

    respond_to do |format|
      if @subsidy_type.update_attributes(params[:subsidy_type])
        format.html { redirect_to @subsidy_type, notice: 'Тип материальной выплаты успешно обновлён.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subsidy_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subsidy_types/1
  # DELETE /subsidy_types/1.json
  def destroy
    @subsidy_type = SubsidyType.find(params[:id])
    @subsidy_type.destroy

    respond_to do |format|
      format.html { redirect_to subsidy_types_url }
      format.json { head :no_content }
    end
  end
end
