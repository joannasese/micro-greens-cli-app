# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'micro_greens/version'

Gem::Specification.new do |spec|
  spec.name          = "micro_greens"
  spec.version       = MicroGreens::
  spec.authors       = ["'Joanna Sese'"]
  spec.email         = ["'jmgsese@gmail.com'"]

  spec.summary       = %q{Micro Greens}
  spec.homepage      = "https://rubygems.org/gems/micro_greens/"
  spec.license       = "MIT"

  # # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files = ["lib/micro_greens.rb", "bin/micro-greens.rb", "lib/micro_greens.rb", "lib/micro_greens/cli.rb", "lib/micro_greens/scraper.rb", "confib/environment.rb"]
  # spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #   f.match(%r{^(test|spec|features)/})
  # end
  spec.bindir        = 'bin'
  spec.executables   = micro-greens
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
