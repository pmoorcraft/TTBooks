class AddFreeToBooks < ActiveRecord::Migration
  def change
    change_column :books, :release, :datetime
  end
end
