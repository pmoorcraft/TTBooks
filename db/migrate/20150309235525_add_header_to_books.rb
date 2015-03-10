class AddHeaderToBooks < ActiveRecord::Migration
  def change
    add_column :books, :header, :string
  end
end
