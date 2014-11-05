
class TeamApiView < ::ApiView::Base
  for_model ::Team
  attributes :abbreviation, :full_name, :location
end
