class AddImageToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :image_url, :string
  end
end
