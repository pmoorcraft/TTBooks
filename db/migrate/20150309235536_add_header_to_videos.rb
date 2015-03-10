class AddHeaderToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :header, :string
  end
end
