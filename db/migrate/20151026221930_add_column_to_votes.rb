class AddColumnToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :value, :integer, default: 1
  end
end
