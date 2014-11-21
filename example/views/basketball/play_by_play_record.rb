class BasketballPlayByPlayRecordApiView < ::ApiView::Base
  for_model ::PlayByPlayRecord
  attributes :points_type, :player_fouls, :player_score, :record_type, :seconds
end
