class AddUserIdToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :user_id, :bigint
    add_foreign_key :listings, :users, column: :user_id, primary_key: :id
  end
end
