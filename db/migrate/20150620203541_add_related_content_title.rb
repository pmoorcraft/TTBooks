class AddRelatedContentTitle < ActiveRecord::Migration
    def change
    add_column :books, :related1name, :string
    add_column :books, :related2name, :string
    add_column :books, :related3name, :string
  end
end
