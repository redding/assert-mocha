require 'assert-mocha'

TEST_ASSERT_SUITE = Assert::Suite.new

module Factory

  def self.context_info_called_from
    "/path/to_file.rb:1234"
  end

  def self.context_info(context_class)
    Assert::Suite::ContextInfo.new(context_class, context_info_called_from)
  end

  # Generate an anonymous `Context` inherited from `TestContext` by default.
  # This provides a common interface for all contexts used in testing.

  def self.context_class(inherit_from=nil, &block)
    inherit_from ||= Assert::Context
    klass = Class.new(inherit_from, &block)
    default = (const_name = "FactoryAssertContext").dup

    while(Object.const_defined?(const_name)) do
      const_name = "FactoryAssertContext#{rand(Time.now.to_i)}"
    end
    Object.const_set(const_name, klass)
    klass
  end

  # Generate a no-op test for use in testing.

  def self.test(*args, &block)
    name = (args[0] || "a test").to_s
    context_info = args[1] || self.context_info(self.context_class)
    test_block = (block || args[2] || ::Proc.new{})

    Assert::Test.new(name, context_info, &test_block)
  end

end
