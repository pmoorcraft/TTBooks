class AddBookidToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :book_id, :integer
   add_index :votes, :book_id
  end
end
