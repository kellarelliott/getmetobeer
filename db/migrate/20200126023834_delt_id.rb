class DeltId < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :breweryDbId
  end
end
