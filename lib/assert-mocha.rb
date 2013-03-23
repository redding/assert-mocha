require 'assert-mocha/version'
require 'assert/context'
require 'mocha/api'

module Assert::Mocha

  def self.included(klass)
    klass.class_eval do
      include ::Mocha::API
      include Assertions

      setup do
        mocha_setup
      end
      teardown do
        mocha_teardown
      end

    end
  end

  module Assertions

    def assert_mocks(counter = nil)
      assert_nothing_raised do
        yield
        mocha_verify(counter)
      end
    end

  end

end

Assert::Context.class_eval{ include Assert::Mocha }
