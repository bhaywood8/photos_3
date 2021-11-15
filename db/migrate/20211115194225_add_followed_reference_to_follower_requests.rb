class AddFollowedReferenceToFollowerRequests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :follower_requests, :users, column: :followed_id
    add_index :follower_requests, :followed_id
    change_column_null :follower_requests, :followed_id, false
  end
end
