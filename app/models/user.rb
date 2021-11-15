class User < ApplicationRecord
  # Direct associations

  has_many   :followed_requests,
             class_name: "FollowerRequest",
             foreign_key: "followed_id",
             dependent: :destroy

  has_many   :follower_requests,
             foreign_key: "follower_id",
             dependent: :destroy

  has_many   :photos,
             dependent: :destroy

  has_many   :comments,
             dependent: :destroy

  has_many   :likes,
             dependent: :destroy

  # Indirect associations

  has_many   :photo_comments,
             through: :comments,
             source: :photo

  has_many   :photo_likes,
             through: :likes,
             source: :photo

  # Validations

  # Scopes

  def to_s
    username
  end
end
