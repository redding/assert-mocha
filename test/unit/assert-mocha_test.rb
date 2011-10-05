require 'assert'

module Assert::Mocha

  class BaseTest < Assert::Context
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

end
