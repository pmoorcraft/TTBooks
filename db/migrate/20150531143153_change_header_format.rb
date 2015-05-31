class ChangeHeaderFormat < ActiveRecord::Migration
  def change
    def up
     change_column :books, :header, :text
    end
  
    def down
     change_column :books, :header, :string
    end
  end
end
