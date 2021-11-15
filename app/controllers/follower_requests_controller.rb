class FollowerRequestsController < ApplicationController
  before_action :set_follower_request, only: %i[show edit update destroy]

  def index
    @q = FollowerRequest.ransack(params[:q])
    @follower_requests = @q.result(distinct: true).includes(:follower,
                                                            :followed).page(params[:page]).per(10)
  end

  def show; end

  def new
    @follower_request = FollowerRequest.new
  end

  def edit; end

  def create
    @follower_request = FollowerRequest.new(follower_request_params)

    if @follower_request.save
      message = "FollowerRequest was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @follower_request, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @follower_request.update(follower_request_params)
      redirect_to @follower_request,
                  notice: "Follower request was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @follower_request.destroy
    message = "FollowerRequest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to follower_requests_url, notice: message
    end
  end

  private

  def set_follower_request
    @follower_request = FollowerRequest.find(params[:id])
  end

  def follower_request_params
    params.require(:follower_request).permit(:follower_id, :followed_id)
  end
end
