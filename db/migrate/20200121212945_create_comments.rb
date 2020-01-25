class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :message
      t.float :rating
      t.string :brewery_db_id
      t.integer :user_id
      t.timestamps
    end

    add_index :comments, :user_id
  end
end
