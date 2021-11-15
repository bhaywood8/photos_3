class CreateFollowerRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :follower_requests do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
