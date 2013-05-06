class SocialActivitiesController < ApplicationController
  # GET /social_activities
  # GET /social_activities.json
  def index
    @social_activities = SocialActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @social_activities }
    end
  end

  # GET /social_activities/1
  # GET /social_activities/1.json
  def show
    @social_activity = SocialActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @social_activity }
    end
  end

  # GET /social_activities/new
  # GET /social_activities/new.json
  def new
    @social_activity = SocialActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @social_activity }
    end
  end

  # GET /social_activities/1/edit
  def edit
    @social_activity = SocialActivity.find(params[:id])
  end

  # POST /social_activities
  # POST /social_activities.json
  def create
    @social_activity = SocialActivity.new(params[:social_activity])

    respond_to do |format|
      if @social_activity.save
        format.html { redirect_to @social_activity, notice: 'Social activity was successfully created.' }
        format.json { render json: @social_activity, status: :created, location: @social_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @social_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /social_activities/1
  # PUT /social_activities/1.json
  def update
    @social_activity = SocialActivity.find(params[:id])

    respond_to do |format|
      if @social_activity.update_attributes(params[:social_activity])
        format.html { redirect_to @social_activity, notice: 'Social activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @social_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_activities/1
  # DELETE /social_activities/1.json
  def destroy
    @social_activity = SocialActivity.find(params[:id])
    @social_activity.destroy

    respond_to do |format|
      format.html { redirect_to social_activities_url }
      format.json { head :no_content }
    end
  end
end
