# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'micro_greens/version'

Gem::Specification.new do |spec|
  spec.name          = "micro_greens"
  spec.version       = MicroGreens::VERSION
  spec.authors       = ["'Joanna Sese'"]
  spec.email         = ["'jmgsese@gmail.com'"]

  spec.summary       = %q{Micro Greens}
  spec.homepage      = "https://rubygems.org/gems/micro_greens/"
  spec.license       = "MIT"
  spec.files         = ["bin/micro_greens", "lib/micro_greens.rb", "lib/micro_greens/cli.rb", "lib/micro_greens/scraper.rb"]

  spec.bindir        = 'bin'
  spec.executables   = "micro_greens"
  spec.require_paths = "lib"
  # spec.required_ruby_version = "~> 2.3.4"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 0"
  spec.add_development_dependency "nokogiri", "~> 1.5"
  spec.add_development_dependency "colorize", "~> 0"
end
