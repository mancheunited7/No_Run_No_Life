class CreateRunExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :run_experiences do |t|
      t.integer :run_level
      t.integer :need_experience_point

      t.timestamps
    end
  end
end
