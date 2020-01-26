class RenameBrweryidToCamel < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :brewery_db_id, :breweryDbId
  end
end
