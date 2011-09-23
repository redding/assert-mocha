# Assert-Mocha

The [assert](https://github.com/teaminsight/assert) gem with [mocha](https://github.com/floehopper/mocha). This gem just mixes in the Mocha API into the Assert context, giving you all the power of Mocha while using Assert.

## Installation

In your Gemfile add:

    group :test do
      gem 'assert-mocha'
    end

Then run `bundle install` to install the gem.

## Usage

Use assert as you normally would. Inherit from a context and use mocha's methods in your tests:

```ruby
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

## License

Copyright (c) 2011 Kelly Redding, Collin Redding, and Team Insight

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.