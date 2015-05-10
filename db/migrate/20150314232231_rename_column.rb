class RenameColumn < ActiveRecord::Migration
  def change
    change_table :videos do |t|
      t.rename :type, :genre
    end
  end
end
