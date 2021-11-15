class Api::V1::FollowerRequestsController < Api::V1::GraphitiController
  def index
    follower_requests = FollowerRequestResource.all(params)
    respond_with(follower_requests)
  end

  def show
    follower_request = FollowerRequestResource.find(params)
    respond_with(follower_request)
  end

  def create
    follower_request = FollowerRequestResource.build(params)

    if follower_request.save
      render jsonapi: follower_request, status: :created
    else
      render jsonapi_errors: follower_request
    end
  end

  def update
    follower_request = FollowerRequestResource.find(params)

    if follower_request.update_attributes
      render jsonapi: follower_request
    else
      render jsonapi_errors: follower_request
    end
  end

  def destroy
    follower_request = FollowerRequestResource.find(params)

    if follower_request.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: follower_request
    end
  end
end
