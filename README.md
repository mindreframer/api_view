# ApiView

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
