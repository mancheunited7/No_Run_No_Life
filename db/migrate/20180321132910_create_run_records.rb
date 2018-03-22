class CreateRunRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :run_records do |t|
      t.references :user, foreign_key: true
      t.integer :run_class, null: false
      t.date :run_record_day, null: false
      t.decimal :run_distance, null: false
      t.integer :run_hour
      t.integer :run_minute, null: false
      t.integer :run_second, null: false
      t.integer :run_calc_time, null: false
      t.text :run_content, null: false, default: ""

      t.timestamps
    end
  end
end
