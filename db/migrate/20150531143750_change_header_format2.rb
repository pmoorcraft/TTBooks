class ChangeHeaderFormat2 < ActiveRecord::Migration
  def change
    change_column :books, :header, :text, :limit => nil
  end
end
