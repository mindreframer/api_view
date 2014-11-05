
require "api_view/views/event"

class BasketballEventApiView < EventApiView

  attributes :important, :location
  alias_method :event, :object

  def convert
    super
    if event.ncaa? then
      store :away_ranking, event.away_ranking
      store :away_region,  event.away_region
      store :home_ranking, event.home_ranking
      store :home_region,  event.home_region
    end

    self
  end

end
