class AddRelationshipsExistingTables < ActiveRecord::Migration
  def change
    add_column :votes, :user_id, :integer
    add_column :questions, :user_id, :integer
    add_column :comments, :user_id, :integer
  end
end
