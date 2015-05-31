class ChangeReleaseFromDateToDatetime < ActiveRecord::Migration
  def change
    change_column :books, :header, :text
  end
end
