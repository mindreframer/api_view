require './test/test_helper'

describe 'hey' do
  class TestApiView < ::ApiView::Base
    attributes :abbreviation, :full_name, :location
  end

  it "works" do
    obj = OpenStruct.new(abbreviation: 'hey', full_name: 'full name', location: 'loc')
    TestApiView.render(obj, nil).must_equal "{\"abbreviation\":\"hey\",\"full_name\":\"full name\",\"location\":\"loc\"}"
  end
end
