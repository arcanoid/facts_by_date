# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'facts_by_date/version'

Gem::Specification.new do |spec|
  spec.name          = "facts_by_date"
  spec.version       = FactsByDate::VERSION
  spec.authors       = ["Vasilis Kalligas"]
  spec.email         = ["billkall@gmail.com"]
  spec.summary       = %q{A generator of facts for a specific date}
  spec.description   = %q{Generate facts of what happened today or for a given date}
  spec.homepage      = "https://rubygems.org/gems/facts_by_date"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'timecop'

  spec.required_ruby_version = '~> 2.2.3'
end
