class FollowerRequestsController < ApplicationController
  before_action :set_follower_request, only: [:show, :edit, :update, :destroy]

  # GET /follower_requests
  def index
    @follower_requests = FollowerRequest.all
  end

  # GET /follower_requests/1
  def show
  end

  # GET /follower_requests/new
  def new
    @follower_request = FollowerRequest.new
  end

  # GET /follower_requests/1/edit
  def edit
  end

  # POST /follower_requests
  def create
    @follower_request = FollowerRequest.new(follower_request_params)

    if @follower_request.save
      message = 'FollowerRequest was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @follower_request, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /follower_requests/1
  def update
    if @follower_request.update(follower_request_params)
      redirect_to @follower_request, notice: 'Follower request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /follower_requests/1
  def destroy
    @follower_request.destroy
    message = "FollowerRequest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to follower_requests_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follower_request
      @follower_request = FollowerRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def follower_request_params
      params.require(:follower_request).permit(:follower_id, :followed_id)
    end
end
