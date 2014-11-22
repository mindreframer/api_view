require './test/test_helper'

describe 'ApiView::Base' do

  describe 'class methods' do
    describe '#render' do
      class RenderTestApiView < ::ApiView::Base
        attributes :abbreviation, :full_name, :location
      end

      it "works" do
        obj      = OpenStruct.new(abbreviation: 'hey', full_name: 'full name', location: 'loc')
        res      = RenderTestApiView.render(obj)
        expected = {"abbreviation"=>"hey", "full_name"=>"full name", "location"=>"loc"}
        MultiJson.load(res).must_equal expected
      end
    end
  end

  describe 'instance methods' do

    describe '#convert' do
      class ConvertSimpleApiView < ::ApiView::Base
        attributes :some_value

        def instance_convert
          field :simple, true
        end
      end

      class ConvertTestApiView < ::ApiView::Base
        attributes :abbreviation, :full_name, :location

        def instance_convert
          field :away_team, 'away_team'
          field :simple_view, object.simple_view, via: ConvertSimpleApiView
        end
      end

      it "works" do
        simple_view = OpenStruct.new(some_value: 'very simple value')
        obj         = OpenStruct.new(abbreviation: 'hey', full_name: 'full name', location: 'loc', simple_view: simple_view)
        res         = ConvertTestApiView.render(obj)
        expected    = {"abbreviation"=>"hey", "full_name"=>"full name", "location"=>"loc", "away_team"=>"away_team", "simple_view"=>{"some_value"=>"very simple value", "simple"=>true}}
        MultiJson.load(res).must_equal expected
      end
    end
  end
end