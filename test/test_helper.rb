require 'rubygems'
require 'bundler'

#require 'coco' # code coverage, needs to be on top! see .coco.yml for more details

require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
  add_filter "/.direnv/"
end
if ENV['CI']=='true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

Bundler.setup(:default, :development)
require 'minitest'
require 'mocha/mini_test'
require "minitest/autorun"

require 'minitest/reporters'
reporter_options = { color: true, slow_count: 10 }
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(reporter_options)]


require 'multi_json'
require 'oj'
Oj.mimic_JSON() # this will speedup benchmarks using #to_json


require 'pry'
require 'api_view'
