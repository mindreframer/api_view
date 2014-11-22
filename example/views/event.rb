class EventApiView < EventSummaryApiView

  for_model ::Event
  attributes :share_url, :sport_name
  main_object :event

  def instance_convert
    field :box_score, event.box_score, via: BasketballBoxScoreApiView
  end

end
