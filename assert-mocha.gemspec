# -*- encoding: utf-8 -*-
require File.expand_path('../lib/assert-mocha/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kelly Redding", "Collin Redding"]
  gem.email         = ["kelly@kelredd.com"]
  gem.description   = %q{Assert with Mocha}
  gem.summary       = %q{Assert with Mocha}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "assert-mocha"
  gem.require_paths = ["lib"]
  gem.version       = Assert::Mocha::VERSION

  gem.add_dependency("assert",  ["~>0.6.0"])
  gem.add_dependency("mocha",   ["~>0.10.0"])
end
