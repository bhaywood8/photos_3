class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :username, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :followed_requests,
             resource: FollowerRequestResource,
             foreign_key: :followed_id

  has_many   :follower_requests,
             foreign_key: :follower_id

  has_many   :photos

  has_many   :comments

  has_many   :likes

  # Indirect associations

end
