class IndexEmai < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :email, :string
    add_index :comments, [:user_id, :email]
    add_index :comments, :email

  end
end
