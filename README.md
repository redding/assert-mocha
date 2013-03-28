# Assert-Mocha

The [assert](https://github.com/teaminsight/assert) gem with [mocha](https://github.com/floehopper/mocha). This gem just mixes in the Mocha API into the Assert context, giving you all the power of Mocha while using Assert.

## Usage

Use assert as you normally would. Inherit from a context and use mocha's methods in your tests:

```ruby
# in test/helper.rb
require 'assert-mocha'

# in tests
class BaseTest < Asset::Context
  desc "some test"
  setup do
    @user = mock()
    @user.expects(:some_method).once
    @user.stubs(:name).returns("Someone")
  end
  subject{ @user }

  should have_instance_methods :name

  should "call the expected method" do
    assert_nothing_raised{ subject.another_method } # assuming another_method calls #some_method
  end

end
```

## Installation

Add this line to your application's Gemfile:

    gem 'assert-mocha'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install assert-mocha

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
