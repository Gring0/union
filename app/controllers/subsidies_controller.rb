class SubsidiesController < ApplicationController
  # GET /subsidies
  # GET /subsidies.json
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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subsidy }
    end
  end

  # GET /subsidies/new
  # GET /subsidies/new.json
  def new
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
    @subsidy = Subsidy.new(params[:subsidy])

    respond_to do |format|
      if @subsidy.save
        format.html { redirect_to @subsidy, notice: 'Subsidy was successfully created.' }
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
        format.html { redirect_to @subsidy, notice: 'Subsidy was successfully updated.' }
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
