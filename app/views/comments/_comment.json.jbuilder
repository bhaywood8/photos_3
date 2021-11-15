json.extract! comment, :id, :user_id, :photo_id, :comment_text, :created_at,
              :updated_at
json.url comment_url(comment, format: :json)
