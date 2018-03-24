class ChangeColumnRunLevelToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :run_level, :integer, null: false, default: 0
    change_column :users, :total_run_experience, :integer, null: false, default: 0
  end
end
