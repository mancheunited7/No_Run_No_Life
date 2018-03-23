class CreateCompetitionPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :competition_places do |t|
      t.references :run_record, foreign_key: true
      t.string :competition_place_address, null: false, default: ""
      t.float :competition_place_latitude, null:false
      t.float :competition_place_longitude, null:false

      t.timestamps
    end
  end
end
