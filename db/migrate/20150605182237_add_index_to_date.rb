class AddIndexToDate < ActiveRecord::Migration
  def change
    add_index :books, :release
    add_index :videos, :uploaded
  end
end
