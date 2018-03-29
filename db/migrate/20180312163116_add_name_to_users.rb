class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :userid, :string, null: false, default: ""
    add_column :users, :provider, :string, null: false, default: ""
    add_column :users, :name, :string
    add_column :users, :total_run_experience, :integer
    add_column :users, :run_level, :integer

    add_index :users, [:userid, :provider], unique: true
  end
end
