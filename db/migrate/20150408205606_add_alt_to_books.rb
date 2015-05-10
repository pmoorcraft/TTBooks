class AddAltToBooks < ActiveRecord::Migration
  def change
    add_column :books, :alt, :string
  end
end
