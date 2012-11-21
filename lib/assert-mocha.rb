require 'assert'
require 'mocha/api'

require 'assert-mocha/version'

module Assert
  module Mocha

    def self.included(klass)
      klass.class_eval do
        include ::Mocha::API
      end
    end

  end
end

Assert::Context.class_eval do
  include Assert::Mocha
end
