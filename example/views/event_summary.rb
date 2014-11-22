class EventSummaryApiView < ::ApiView::Base

  attributes :game_date, :game_type, :status
  main_object :event

  def instance_convert
    field :away_team, event.away_team, via: BasketballTeamApiView
    field :home_team, event.home_team, via: BasketballTeamApiView
  end

end
