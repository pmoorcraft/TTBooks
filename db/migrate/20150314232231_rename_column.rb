class RenameColumn < ActiveRecord::Migration
  def change
    change_table :Videos do |t|
      t.rename :type, :genre
    end
  end
end
