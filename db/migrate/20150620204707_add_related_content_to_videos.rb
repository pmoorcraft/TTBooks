class AddRelatedContentToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :related1, :string
    add_column :videos, :related2, :string
    add_column :videos, :related3, :string
    add_column :videos, :related1name, :string
    add_column :videos, :related2name, :string
    add_column :videos, :related3name, :string
  end
end
