
class BoxScoreApiView < ::ApiView::Base
  for_model ::BoxScore
  attributes :has_statistics, :progress
end
