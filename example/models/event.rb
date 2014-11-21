class Event < Model
  attr_reader :away_ranking,
              :away_region,
              :away_team,
              :box_score,
              :game_date,
              :game_type,
              :home_ranking,
              :home_region,
              :home_team,
              :important,
              :location,
              :share_url,
              :sport_name,
              :status

  def ncaa?
    true
  end
end
