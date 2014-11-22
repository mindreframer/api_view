class BasketballBoxScoreApiView < BoxScoreApiView

  attributes :attendance, :referees
  main_object :box_score


  def instance_convert
    field :last_play, box_score.last_play, via: BasketballPlayByPlayRecordApiView
  end

end
