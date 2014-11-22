class EventSummaryApiView < ::ApiView::Base

  attributes :game_date, :game_type, :status
  main_object :event

  def convert_instance
    store :away_team, event.away_team, via: BasketballTeamApiView
    store :home_team, event.home_team, via: BasketballTeamApiView
  end

end
