class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :board, foreign_key: true
      t.integer :user_id, null: false
      t.string :user_name, null: false, default: ""
      t.text :content

      t.timestamps
    end
  end
end
