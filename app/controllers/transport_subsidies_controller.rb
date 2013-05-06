class TransportSubsidiesController < ApplicationController
  # GET /transport_subsidies
  # GET /transport_subsidies.json
  def index
    @transport_subsidies = TransportSubsidy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transport_subsidies }
    end
  end

  # GET /transport_subsidies/1
  # GET /transport_subsidies/1.json
  def show
    @transport_subsidy = TransportSubsidy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transport_subsidy }
    end
  end

  # GET /transport_subsidies/new
  # GET /transport_subsidies/new.json
  def new
    @transport_subsidy = TransportSubsidy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transport_subsidy }
    end
  end

  # GET /transport_subsidies/1/edit
  def edit
    @transport_subsidy = TransportSubsidy.find(params[:id])
  end

  # POST /transport_subsidies
  # POST /transport_subsidies.json
  def create
    @transport_subsidy = TransportSubsidy.new(params[:transport_subsidy])

    respond_to do |format|
      if @transport_subsidy.save
        format.html { redirect_to @transport_subsidy, notice: 'Transport subsidy was successfully created.' }
        format.json { render json: @transport_subsidy, status: :created, location: @transport_subsidy }
      else
        format.html { render action: "new" }
        format.json { render json: @transport_subsidy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transport_subsidies/1
  # PUT /transport_subsidies/1.json
  def update
    @transport_subsidy = TransportSubsidy.find(params[:id])

    respond_to do |format|
      if @transport_subsidy.update_attributes(params[:transport_subsidy])
        format.html { redirect_to @transport_subsidy, notice: 'Transport subsidy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transport_subsidy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transport_subsidies/1
  # DELETE /transport_subsidies/1.json
  def destroy
    @transport_subsidy = TransportSubsidy.find(params[:id])
    @transport_subsidy.destroy

    respond_to do |format|
      format.html { redirect_to transport_subsidies_url }
      format.json { head :no_content }
    end
  end
end
