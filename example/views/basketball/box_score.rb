class BasketballBoxScoreApiView < BoxScoreApiView

  attributes :attendance, :referees
  main_object :box_score


  def convert_instance
    store :last_play, box_score.last_play, via: BasketballPlayByPlayRecordApiView
  end

end
