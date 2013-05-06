class SanatoriaController < ApplicationController
  # GET /sanatoria
  # GET /sanatoria.json
  def index
    @sanatoria = Sanatorium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sanatoria }
    end
  end

  # GET /sanatoria/1
  # GET /sanatoria/1.json
  def show
    @sanatorium = Sanatorium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sanatorium }
    end
  end

  # GET /sanatoria/new
  # GET /sanatoria/new.json
  def new
    @sanatorium = Sanatorium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sanatorium }
    end
  end

  # GET /sanatoria/1/edit
  def edit
    @sanatorium = Sanatorium.find(params[:id])
  end

  # POST /sanatoria
  # POST /sanatoria.json
  def create
    @sanatorium = Sanatorium.new(params[:sanatorium])

    respond_to do |format|
      if @sanatorium.save
        format.html { redirect_to @sanatorium, notice: 'Sanatorium was successfully created.' }
        format.json { render json: @sanatorium, status: :created, location: @sanatorium }
      else
        format.html { render action: "new" }
        format.json { render json: @sanatorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sanatoria/1
  # PUT /sanatoria/1.json
  def update
    @sanatorium = Sanatorium.find(params[:id])

    respond_to do |format|
      if @sanatorium.update_attributes(params[:sanatorium])
        format.html { redirect_to @sanatorium, notice: 'Sanatorium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sanatorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sanatoria/1
  # DELETE /sanatoria/1.json
  def destroy
    @sanatorium = Sanatorium.find(params[:id])
    @sanatorium.destroy

    respond_to do |format|
      format.html { redirect_to sanatoria_url }
      format.json { head :no_content }
    end
  end
end
