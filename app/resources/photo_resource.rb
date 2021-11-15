class PhotoResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :image, :string
  attribute :caption, :string
  attribute :location, :string

  # Direct associations

  # Indirect associations

end
