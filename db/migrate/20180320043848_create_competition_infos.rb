class CreateCompetitionInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :competition_infos do |t|
      t.date :competition_day, null: false
      t.string :competition_name, null: false, default: ""
      t.string :competition_place, null: false, default: ""
      t.string :competition_site, default: ""
      t.integer :competition_classification

      t.timestamps
    end
  end
end
