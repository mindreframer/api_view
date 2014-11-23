# ApiView


[![Build Status](https://travis-ci.org/mindreframer/api_view.svg?branch=master)](http://travis-ci.org/mindreframer/api_view)


a small and very performance focused serializer for complex nested objects. The initial code was taken from `chetan` and was wrapped into a gem with unit-tests and a bit more convenient API. The original links are below:
  - http://techblog.thescore.com/benchmarking-json-generation-in-ruby/#comment-1678429451
  - https://github.com/chetan/json_serialization_benchmark/tree/api_view
  - https://gist.github.com/chetan/d613e8f7d45600e1ca34



### Why should you even care? Is (... insert your favourite ruby serializer ... ) not good enough?

Well, all those gems are fine, if you don't care about the raw numbers and want only a nice way to convert your objects to Json or XML. With the recent advent of Single Page Application with heavy requirements for JSON APIs I'd like to squeeze all the performance that is possible while staying in the comfort of Ruby lang. And I want those serializers to be fast and easy to test.

ApiView gives you all that and stays very-very small doing that.




## Installation

Add this line to your application's Gemfile:

```ruby
gem 'api_view'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install api_view

## Usage

TODO: Write usage instructions here

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