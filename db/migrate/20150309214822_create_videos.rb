class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.text :description
      t.date :uploaded
      t.text :speakers

      t.timestamps null: false
    end
    add_index :videos, :title
  end
end
