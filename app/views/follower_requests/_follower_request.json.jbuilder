json.extract! follower_request, :id, :follower_id, :followed_id, :created_at, :updated_at
json.url follower_request_url(follower_request, format: :json)
