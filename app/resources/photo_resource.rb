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

end
