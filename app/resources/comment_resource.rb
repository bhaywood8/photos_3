class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :photo_id, :integer
  attribute :comment_text, :string

  # Direct associations

  belongs_to :photo

  belongs_to :user

  # Indirect associations
end
