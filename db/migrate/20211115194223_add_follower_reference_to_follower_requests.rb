class AddFollowerReferenceToFollowerRequests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :follower_requests, :users, column: :follower_id
    add_index :follower_requests, :follower_id
    change_column_null :follower_requests, :follower_id, false
  end
end
