class AddFreeToBooks < ActiveRecord::Migration
  def change
    add_column :books, :free_book, :string
  end
end
