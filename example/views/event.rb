
require "api_view/views/event_summary"

class EventApiView < EventSummaryApiView

  for_model ::Event
  attributes :share_url, :sport_name
  alias_method :event, :object

  def convert
    super
    store :box_score, BasketballBoxScoreApiView.new(event.box_score).convert
    self
  end

end
