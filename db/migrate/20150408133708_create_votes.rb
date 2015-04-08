class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :video_id
      t.string  :ip
    end
    add_index :votes, :video_id
    add_index :votes, :ip
  end
end
