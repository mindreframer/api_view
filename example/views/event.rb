class EventApiView < EventSummaryApiView

  for_model ::Event
  attributes :share_url, :sport_name
  main_object :event

  def convert_instance
    store :box_score, event.box_score, via: BasketballBoxScoreApiView
  end

end
