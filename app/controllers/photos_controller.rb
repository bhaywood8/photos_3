class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  def index
    @photos = Photo.all
    @location_hash = Gmaps4rails.build_markers(@photos.where.not(:location_latitude => nil)) do |photo, marker|
      marker.lat photo.location_latitude
      marker.lng photo.location_longitude
      marker.infowindow "<h5><a href='/photos/#{photo.id}'>#{photo.user_id}</a></h5><small>#{photo.location_formatted_address}</small>"
    end
  end

  # GET /photos/1
  def show
    @like = Like.new
    @comment = Comment.new
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      message = 'Photo was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @photo, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
    message = "Photo was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to photos_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def photo_params
      params.require(:photo).permit(:user_id, :image, :caption, :location)
    end
end
