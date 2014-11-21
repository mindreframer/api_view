require './test/test_helper'

describe 'hey' do
  it "works" do
    (1+1).must_equal 2


    event = EventFactory.build_event
    team  = event.home_team

    event_collection = collection_size.times.map { event }
    team_collection  = collection_size.times.map { team }


  end
end
