class AddTagToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :tag, :string
  end
end
