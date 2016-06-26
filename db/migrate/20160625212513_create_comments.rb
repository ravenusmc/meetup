class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :comment
      t.integer :user_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
