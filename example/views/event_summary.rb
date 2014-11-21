
class EventSummaryApiView < ::ApiView::Base

  attributes :game_date, :game_type, :status

  def convert
    super
    store :away_team, BasketballTeamApiView.new(obj.away_team).convert
    store :home_team, BasketballTeamApiView.new(obj.home_team).convert
    self
  end

end
