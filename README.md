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
    RABL Ultra Simple                         4.950000   0.630000   5.580000 (  5.591347)              664        25787
    AMS Ultra Simple                          0.240000   0.000000   0.240000 (  0.245469)               26          650
    Presenters Ultra Simple                   0.170000   0.010000   0.180000 (  0.173634)               24          650
    ApiView Ultra Simple                      0.170000   0.000000   0.170000 (  0.176260)               12          842
    -------------------------------------------------------------------------------------------------------------------
    RABL Simple                              20.220000   3.080000  23.300000 ( 23.363272)             2265       114051
    AMS Simple                                1.090000   0.010000   1.100000 (  1.095068)              105         2726
    Presenters Simple                         0.520000   0.000000   0.520000 (  0.519320)               98         2918
    ApiView Simple                            0.290000   0.000000   0.290000 (  0.287977)               17         2246
    -------------------------------------------------------------------------------------------------------------------
    RABL Complex                             40.560000   6.180000  46.740000 ( 46.866264)             4325       248000
    AMS Complex                               2.060000   0.000000   2.060000 (  2.071719)              209         5851
    Presenters Complex                        1.180000   0.000000   1.180000 (  1.188937)              201         7395
    ApiView Complex                           0.310000   0.000000   0.310000 (  0.311223)               21         1504


    Collection tests:

                                                  user     system      total        real       allocations      memsize
    RABL Ultra Simple: Collection             0.190000   0.030000   0.220000 (  0.220378)            43102      1977224
    AMS Ultra Simple: Collection              0.000000   0.000000   0.000000 (  0.006251)             1914        47786
    Presenters Ultra Simple: Collection       0.000000   0.000000   0.000000 (  0.004430)             3508        67594
    ApiView Ultra Simple: Collection          0.000000   0.000000   0.000000 (  0.002176)              311        46986
    -------------------------------------------------------------------------------------------------------------------
    RABL Simple: Collection                   0.960000   0.160000   1.120000 (  1.129021)           202905     11255130
    AMS Simple: Collection                    0.040000   0.000000   0.040000 (  0.043405)             9714       236186
    Presenters Simple: Collection             0.030000   0.010000   0.040000 (  0.032161)            16108       380794
    ApiView Simple: Collection                0.010000   0.000000   0.010000 (  0.006021)              812       187386
    -------------------------------------------------------------------------------------------------------------------
    RABL Complex: Collection                  2.110000   0.370000   2.480000 (  2.499077)           408015     25251570
    AMS Complex: Collection                   0.090000   0.000000   0.090000 (  0.091626)            20114       548686
    Presenters Complex: Collection            0.060000   0.000000   0.060000 (  0.057906)            34408       960494
    ApiView Complex: Collection               0.010000   0.000000   0.010000 (  0.011354)             1212       113186
