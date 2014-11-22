require 'rubygems'
require 'bundler'
Bundler.setup(:default, :development)
require 'minitest'
#require "mocha/mini_test"
require "minitest/autorun"
require 'api_view'


require 'multi_json'
require 'oj'
Oj.mimic_JSON() # this will speedup benchmarks using #to_json



# custom output
require 'minitest/reporters'
reporter_options = { color: true, slow_count: 10 }
#Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(reporter_options)]
