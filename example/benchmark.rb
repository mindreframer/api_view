require './example/require_models'
require 'ruby-prof'

module SerializationBenchmark
  collection_size = 100
  event = EventFactory.build_event
  team  = event.home_team

  event_collection = collection_size.times.map { event }
  team_collection  = collection_size.times.map { EventFactory.home_team }


  module ProfHelper
    def with_profiler()
      RubyProf.start
      yield
      result  = RubyProf.stop
      printer = RubyProf::FlatPrinter.new(result)
      printer.print(STDOUT, :min_percent => 2)
    end
  end

  Benchmark.benchmark(Benchmark::CAPTION, 40) do |b|
    sample_size  = 10_000
    divider_size = 86


    b.report('ApiView Ultra Simple') do
      sample_size.times do
        ApiView::Engine.render(team, nil, :format => "json")
      end
    end

    puts '-' * divider_size

    b.report('ApiView Simple') do
      sample_size.times do
        EventSummaryApiView.render(event, nil, :format => "json")
      end
    end

    puts '-' * divider_size

    b.report('ApiView Complex') do
      sample_size.times do
        BasketballEventApiView.render(event, nil, :format => "json")
      end
    end
  end

  puts "\n\n"

  Benchmark.benchmark(Benchmark::CAPTION, 40) do |b|
    extend ProfHelper
    sample_size  = 100
    divider_size = 86

    b.report('ApiView Ultra Simple: Collection') do
      sample_size.times do
        # automatic view class recognition
        ApiView::Engine.render(team_collection, nil, :format => "json")
      end
    end

    puts '-' * divider_size

    b.report('ApiView Simple: Collection') do
      sample_size.times do
        EventSummaryApiView.render(event_collection, nil, :format => "json")
      end
    end

    puts '-' * divider_size

    b.report('ApiView Complex: Collection') do
      with_profiler do
        sample_size.times do
          EventSummaryApiView.render(event_collection, nil, :format => "json")
        end
      end
    end
  end
end
