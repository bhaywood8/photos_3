class PhotoResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :image, :string
  attribute :caption, :string
  attribute :location, :string

  # Direct associations

  has_many   :likes

  has_many   :comments

  belongs_to :user

  # Indirect associations

  many_to_many :user_comments,
               resource: UserResource

  many_to_many :user_likes,
               resource: UserResource
end
