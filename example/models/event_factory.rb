class EventFactory
  def self.build_event
    last_play = PlayByPlayRecord.new(
      points_type: 'Field Goal',
      player_fouls: 10,
      player_score: 15,
      record_type: 'Postseason',
      seconds: 100
    )

    box_score = BoxScore.new(
      last_play: last_play,
      attendance: '21,307',
      has_statistics: true,
      progress: '11:23 2nd',
      referees: 'Thuva, Nate, Roel'
    )

    home_team = Team.new(
      abbreviation: 'TOR',
      full_name: 'Toronto Raptors',
      location: 'Toronto',
      medium_name: 'Toronto',
      short_name: 'Raptors'
    )

    away_team = Team.new(
      abbreviation: 'MIA',
      full_name: 'Miami Heats',
      location: 'Miami',
      meidum_name: 'Miami',
      short_name: 'Heats'
    )

    Event.new(
      away_team: away_team,
      box_score: box_score,
      home_team: home_team,
      away_ranking: 10,
      away_region: 'Pac-12',
      game_date: Date.today,
      game_type: 'Regular Season',
      home_ranking: 15,
      home_region: 'Top 25',
      important: true,
      location: 'Washington, DC',
      share_url: 'http://thesco.re/123',
      sport_name: 'basketball',
      status: 'Final'
    )
  end
end
