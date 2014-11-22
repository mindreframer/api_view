class BasketballEventApiView < EventApiView

  attributes :important, :location
  main_object :event

  def convert_instance
    if event.ncaa? then
      store :away_ranking, event.away_ranking
      store :away_region,  event.away_region
      store :home_ranking, event.home_ranking
      store :home_region,  event.home_region
    end
  end

end
