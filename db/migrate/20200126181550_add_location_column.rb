class AddLocationColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :location, :string
  end
end
