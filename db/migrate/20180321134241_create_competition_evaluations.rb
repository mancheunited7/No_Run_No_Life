class CreateCompetitionEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :competition_evaluations do |t|
      t.references :run_record, foreign_key: true
      t.integer :competition_point, null: false, default: 0
      t.text :competition_evaluation

      t.timestamps
    end
  end
end
