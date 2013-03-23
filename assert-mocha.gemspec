# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "assert-mocha/version"

Gem::Specification.new do |gem|
  gem.name          = "assert-mocha"
  gem.version       = Assert::Mocha::VERSION
  gem.authors       = ["Collin Redding", "Kelly Redding"]
  gem.email         = ["collin.redding@me.com, kelly@kellyredding.com"]
  gem.description   = %q{Assert with Mocha}
  gem.summary       = %q{Assert with Mocha}
  gem.homepage      = "https://github.com/redding/assert-mocha"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("assert",  ["~> 2.0"])
  gem.add_dependency("mocha",   ["~> 0.13"])
end
