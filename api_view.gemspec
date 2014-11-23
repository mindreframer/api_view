# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'api_view/version'

Gem::Specification.new do |spec|
  spec.name          = "api_view"
  spec.version       = ApiView::VERSION
  spec.authors       = ["Roman Heinrich"]
  spec.email         = ["roman.heinrich@gmail.com"]
  spec.summary       = %q{A fast and nimble object serializer}
  spec.description   = %q{A fast and nimble object serializer}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "require_pattern"
  spec.add_development_dependency "minitest", '~> 5.4.3'
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "oj"
  spec.add_development_dependency "multi_json"
  spec.add_development_dependency "ffaker"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "ruby-prof"
  spec.add_development_dependency "allocation_stats"
  spec.add_development_dependency "bixby-bench"
  spec.add_development_dependency "coco"

end
