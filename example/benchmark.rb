require './example/require_models'

module SerializationBenchmark
  collection_size = 100
  event = EventFactory.build_event
  team  = event.home_team

  event_collection = collection_size.times.map { event }
  team_collection  = collection_size.times.map { EventFactory.home_team }

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
        ApiView::Engine.render(event, nil, :format => "json", :use => EventSummaryApiView)
      end
    end

    puts '-' * divider_size

    b.report('ApiView Complex') do
      sample_size.times do
        ApiView::Engine.render(event, nil, :format => "json", :use => BasketballEventApiView)
      end
    end
  end

  puts "\n\n"

  Benchmark.benchmark(Benchmark::CAPTION, 40) do |b|
    sample_size  = 100
    divider_size = 86

    b.report('ApiView Ultra Simple: Collection') do
      sample_size.times do
        ApiView::Engine.render(team_collection, nil, :format => "json")
      end
    end

    puts '-' * divider_size

    b.report('ApiView Simple: Collection') do
      sample_size.times do
        ApiView::Engine.render(event_collection, nil, :format => "json", :use => EventSummaryApiView)
      end
    end

    puts '-' * divider_size

    b.report('ApiView Complex: Collection') do
      sample_size.times do
        ApiView::Engine.render(event_collection, nil, :format => "json", :use => BasketballEventApiView)
      end
    end
  end
end
