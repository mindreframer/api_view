require 'bundler'
Bundler.setup
require 'benchmark'
require 'api_view'

require 'multi_json'
require 'oj'
require 'pry'
Oj.mimic_JSON() # this will speedup benchmarks using #to_json


require 'require_pattern'
require_relative_pattern 'models/**/**.rb'
require_relative_pattern 'views/**/**.rb'

