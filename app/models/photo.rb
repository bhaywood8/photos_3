class Photo < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :user_likes,
             :through => :likes,
             :source => :user

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
