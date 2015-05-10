class RenameColumn2 < ActiveRecord::Migration
  def change
    change_table :books do |t|
    t.rename :type, :genre
    end
  end
end
