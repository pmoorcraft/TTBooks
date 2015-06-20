class AddRelatedContent < ActiveRecord::Migration
  def change
    add_column :books, :related1, :string
    add_column :books, :related2, :string
    add_column :books, :related3, :string
  end
end
