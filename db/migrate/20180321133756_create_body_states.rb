class CreateBodyStates < ActiveRecord::Migration[5.1]
  def change
    create_table :body_states do |t|
      t.references :run_record, foreign_key: true
      t.integer :heart_rate
      t.decimal :day_weight
      t.decimal :day_body_fat

      t.timestamps
    end
  end
end
