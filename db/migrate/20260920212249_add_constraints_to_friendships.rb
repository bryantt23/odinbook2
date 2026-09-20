class AddConstraintsToFriendships < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :friendships, :users, column: :user_id
    add_foreign_key :friendships, :users, column: :friend_id

    change_column_null :friendships, :user_id, false
    change_column_null :friendships, :friend_id, false

    add_index :friendships, [ :user_id, :friend_id ], unique: true
  end
end
