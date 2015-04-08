class AddAltToBooks < ActiveRecord::Migration
  def change
    add_column :Books, :alt, :string
  end
end
