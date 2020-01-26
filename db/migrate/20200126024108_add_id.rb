class AddId < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :brewery_db_id, :text
  end
end
