require 'assert'
require 'assert/context'
require 'mocha/api'

module Assert::Mocha

  class BaseTests < Assert::Context
    desc "Assert::Context"
    setup do
      @class = Assert::Context
      @instance = Assert::Context.new
    end
    subject{ @instance }

    should have_instance_methods :mock, :stub

    should "include the Mocha::API" do
      assert_includes Mocha::API, @class.included_modules
    end
  end

  class AssertMocksTests < BaseTests
    desc "assert_mocks"
    setup do
      object = Class.new do
        def self.works
          self.call_this
          self.call_this
        end
        def self.doesnt_work
          self.call_this
        end
      end
      object.expects(:call_this).twice
      @test = Factory.test do
        assert_mocks{ object.works }
        assert_mocks{ object.doesnt_work }
      end
      @test.run
    end
    subject{ @test }

    should "pass calling #works and fail calling #doesnt_work" do
      assert_equal 1, subject.result_count(:pass)
      assert_equal 1, subject.result_count(:fail)
    end

  end

end
