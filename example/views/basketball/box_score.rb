class BasketballBoxScoreApiView < BoxScoreApiView

  attributes :attendance, :referees
  main_object :box_score


  def convert
    super
    store :last_play, BasketballPlayByPlayRecordApiView.new(box_score.last_play).convert
    self
  end

end
