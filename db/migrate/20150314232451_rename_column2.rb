class RenameColumn2 < ActiveRecord::Migration
  def change
    change_table :Books do |t|
    t.rename :type, :genre
    end
  end
end
