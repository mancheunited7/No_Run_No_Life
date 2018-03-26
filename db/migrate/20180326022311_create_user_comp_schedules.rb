class CreateUserCompSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :user_comp_schedules do |t|
      t.references :user, foreign_key: true
      t.references :competition_info, foreign_key: true

      t.timestamps
    end
    add_index :user_comp_schedules, [:user_id, :competition_info_id], unique: true
  end
end
