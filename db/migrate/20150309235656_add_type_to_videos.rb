class AddTypeToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :type, :string
  end
end
