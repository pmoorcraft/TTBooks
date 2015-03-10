class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :amazon
      t.string :author
      t.string :publisher
      t.date :release

      t.timestamps null: false
    end
    add_index :books, :title
  end
end
