class CompetitionPlace < ApplicationRecord
  belongs_to :run_record

  #住所から経度、緯度を取得
  geocoded_by :competition_place_address, latitude: :competition_place_latitude, longitude: :competition_place_longitude
  after_validation :geocode, if: :competition_place_address_changed?

  #GoogleMap表示用データ
  def self.set_map(competition_result)
    hash = Gmaps4rails.build_markers(competition_result) do |comp_result, marker|
      marker.lat comp_result.competition_place.competition_place_latitude
      marker.lng comp_result.competition_place.competition_place_longitude
      marker.infowindow comp_result.competition_place.competition_name
    end
  end
end
