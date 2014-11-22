require './test/test_helper'

describe 'ApiView::Base' do

  before do
    ApiView::Engine.skip_serialization = true
  end
  after do
    ApiView::Engine.skip_serialization = false
  end

  describe 'class methods' do
    describe '#render' do
      class RenderTestApiView < ::ApiView::Base
        attributes :abbreviation, :full_name, :location
      end

      it "renders json by default" do
        ApiView::Engine.skip_serialization = false
        obj      = OpenStruct.new(abbreviation: 'hey', full_name: 'full name', location: 'loc')
        res      = RenderTestApiView.render(obj)
        expected = {"abbreviation"=>"hey", "full_name"=>"full name", "location"=>"loc"}
        MultiJson.load(res).must_equal expected
      end

      describe 'serialization skipping' do
        it "global skipping can be overriden for each render call" do
          ApiView::Engine.skip_serialization = true
          obj      = OpenStruct.new(abbreviation: 'hey', full_name: 'full name', location: 'loc')
          res      = RenderTestApiView.render(obj, {}, {skip_serialization: false})
          expected = "{\"abbreviation\":\"hey\",\"full_name\":\"full name\",\"location\":\"loc\"}"
          res.must_equal expected
        end

        it "also returns a hash, if global serialization is skipped" do
          ApiView::Engine.skip_serialization = true
          obj      = OpenStruct.new(abbreviation: 'hey', full_name: 'full name', location: 'loc')
          res      = RenderTestApiView.render(obj)
          expected = {abbreviation: "hey", full_name: "full name", location: "loc"}
          res.must_equal expected
        end
      end
    end

    describe '#main_object' do
      class MainObjectApiView < ::ApiView::Base
        main_object :main_obj
        attributes :location
        def instance_convert
          field :hey, main_obj.no_hey
        end
      end

      it "allows to call object by some custom name" do
        obj = OpenStruct.new(location: 'some location', no_hey: 'some hey')
        res = MainObjectApiView.render(obj)
        res.must_equal({:location=>"some location", :hey=>"some hey"})
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

      it "works for nested serialization" do
        simple_view = OpenStruct.new(some_value: 'very simple value')
        obj         = OpenStruct.new(abbreviation: 'hey', full_name: 'full name', location: 'loc', simple_view: simple_view)
        res         = ConvertTestApiView.render(obj)
        expected    = {:abbreviation=>"hey", :full_name=>"full name", :location=>"loc", :away_team=>"away_team", :simple_view=>{:some_value=>"very simple value", :simple=>true}}
        res.must_equal expected
      end
    end
  end
end