class BasketballEventApiView < EventApiView

  attributes :important, :location
  main_object :event

  def instance_convert
    if event.ncaa? then
      field :away_ranking, event.away_ranking
      field :away_region,  event.away_region
      field :home_ranking, event.home_ranking
      field :home_region,  event.home_region
    end
  end

end
