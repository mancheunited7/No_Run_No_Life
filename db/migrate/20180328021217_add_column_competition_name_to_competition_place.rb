class AddColumnCompetitionNameToCompetitionPlace < ActiveRecord::Migration[5.1]
  def change
    add_column :competition_places, :competition_name, :string, null:false, default: ""
  end
end
