require 'assert'
require 'mocha'

module Assert
  module Mocha
    autoload :VERSION, 'assert-mocha/version'
  end
end

Assert::Context.class_eval do
  include Mocha::API
end
