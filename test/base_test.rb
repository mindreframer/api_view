require './test/test_helper'

describe '#render' do
  class RenderTestApiView < ::ApiView::Base
    attributes :abbreviation, :full_name, :location
  end

  it "works" do
    obj      = OpenStruct.new(abbreviation: 'hey', full_name: 'full name', location: 'loc')
    res      = RenderTestApiView.render(obj, nil)
    expected = {"abbreviation"=>"hey", "full_name"=>"full name", "location"=>"loc"}
    MultiJson.load(res).must_equal expected
  end
end

describe '#convert' do
  class ConvertTestApiView < ::ApiView::Base
    attributes :abbreviation, :full_name, :location

    def instance_convert
      field :away_team, 'away_team'
    end
  end

  it "works" do
    obj      = OpenStruct.new(abbreviation: 'hey', full_name: 'full name', location: 'loc')
    res      = ConvertTestApiView.render(obj, nil)
    expected = {"abbreviation"=>"hey", "full_name"=>"full name", "location"=>"loc", "away_team"=>"away_team"}
    MultiJson.load(res).must_equal expected
  end
end
