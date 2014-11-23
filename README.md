# ApiView

[![Build Status](https://travis-ci.org/mindreframer/api_view.svg?branch=master)](http://travis-ci.org/mindreframer/api_view)
[![codecov.io](https://codecov.io/github/mindreframer/api_view/coverage.svg?branch=master)](https://codecov.io/github/mindreframer/api_view?branch=master)

Object serializer with
  - small codebase
  - focus on performance
  - benchmarks are guiding the implementation

The initial code was copied from `chetan` and wrapped into a gem with unit-tests and a bit more convenient API [Original Links](#original-links)



### Why should you even care? Is (... insert your favourite ruby serializer ... ) not good enough?

  - you want great performance
  - you care about object allocations (less garbage to collect for the Ruby VM)
  - you want **blazing** fast test suite, so that you can switch globally the serialization off and test just the shape of the resulting Hash object
    -> no converting to JSON, then parsing JSON back and checking values on it, that sux!
  - really small and clean codebase
  - unit-tested and with test 100% coverage

ApiView gives you all that and stays very small doing that.

## Installation

    ## Add this line to your application's Gemfile:
    gem 'api_view'


    ## And then execute:
    $ bundle


## Usage

  - you inherit from ApiView::Base
  - you say, what model should be serialized by default with this serializer (optional)
  - you specify an array of attributes, that will be copied from the object in serializer
  - you tell how you main object is called (defaults to `object` / `obj`)
  - you implement `instance_convert`-method for further customization of the serialization
    -> `field` - a setter method, that also accepts `via: SomeSerializerApiView`


        class EventApiView < EventSummaryApiView
          # default serializer for BoxScore, will be picked, if none other was given
          for_model ::Event

          # the attributes to copy from the object
          attributes :share_url, :sport_name

          # the name of your main object, optional
          main_object :event

          # the method to add additional logic + fields
          def instance_convert
            # just a setter method with optional serializer for that sub-object
            field :box_score, event.box_score, via: BasketballBoxScoreApiView
          end
        end


  For more examples take a look into the `example/`-folder and run the benchmark script via `ruby example/benchmark.rb`.



## Developement

    # run tests
    $ sh/test




## Contributing

1. Fork it ( https://github.com/[my-github-username]/api_view/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request



## Benchmark numbers (ApiView vs the rest of the pack)

                                                  user     system      total        real       allocations      memsize
    RABL Ultra Simple                         4.860000   0.620000   5.480000 (  5.493406)              664        25787
    AMS Ultra Simple                          0.220000   0.000000   0.220000 (  0.220079)               26          650
    Presenters Ultra Simple                   0.140000   0.000000   0.140000 (  0.152729)               24          650
    ApiView Ultra Simple                      0.190000   0.000000   0.190000 (  0.193124)               12          842
    -------------------------------------------------------------------------------------------------------------------
    RABL Simple                              21.470000   3.330000  24.800000 ( 25.147988)             2265       114051
    AMS Simple                                1.060000   0.000000   1.060000 (  1.066668)              105         2726
    Presenters Simple                         0.610000   0.000000   0.610000 (  0.611980)               98         2918
    ApiView Simple                            0.280000   0.010000   0.290000 (  0.292290)               17         2246
    -------------------------------------------------------------------------------------------------------------------
    RABL Complex                             43.930000   6.850000  50.780000 ( 51.574975)             4325       248000
    AMS Complex                               2.150000   0.000000   2.150000 (  2.160445)              209         5851
    Presenters Complex                        1.210000   0.010000   1.220000 (  1.220806)              201         7395
    ApiView Complex                           0.270000   0.000000   0.270000 (  0.270517)               21         1504


    Collection tests:

                                                  user     system      total        real       allocations      memsize
    RABL Ultra Simple: Collection             3.560000   0.600000   4.160000 (  4.182852)            43102      1977224
    AMS Ultra Simple: Collection              0.120000   0.000000   0.120000 (  0.124631)             1914        47786
    Presenters Ultra Simple: Collection       0.100000   0.010000   0.110000 (  0.109781)             3508        67594
    ApiView Ultra Simple: Collection          0.050000   0.000000   0.050000 (  0.050875)              311        46986
    -------------------------------------------------------------------------------------------------------------------
    RABL Simple: Collection                  18.720000   3.150000  21.870000 ( 21.924020)           202905     11255130
    AMS Simple: Collection                    0.870000   0.010000   0.880000 (  0.890479)             9714       236186
    Presenters Simple: Collection             0.540000   0.000000   0.540000 (  0.542100)            16108       380794
    ApiView Simple: Collection                0.160000   0.000000   0.160000 (  0.166484)              812       187386
    -------------------------------------------------------------------------------------------------------------------
    RABL Complex: Collection                 41.190000   6.680000  47.870000 ( 48.438854)           408015     25251570
    AMS Complex: Collection                   2.170000   0.030000   2.200000 (  2.211721)            20114       548686
    Presenters Complex: Collection            1.380000   0.010000   1.390000 (  1.389608)            34408       960494
    ApiView Complex: Collection               0.150000   0.000000   0.150000 (  0.145595)             1212       113186


## Original links:
  - http://techblog.thescore.com/benchmarking-json-generation-in-ruby/#comment-1678429451
  - https://github.com/chetan/json_serialization_benchmark/tree/api_view
  - https://gist.github.com/chetan/d613e8f7d45600e1ca34
