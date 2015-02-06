# activesupport-testing-metadata

[![Build Status](https://travis-ci.org/y-yagi/activesupport-testing-metadata.svg?branch=master)](https://travis-ci.org/y-yagi/activesupport-testing-metadata)

Metadata (key-value) support for `ActiveSupport::TestCase.test` method.

## Example

```ruby
require 'active_support/testing/metadata'

class IntegrationTest < ActionDispatch::IntegrationTest
  def setup
    if metadata[:js]
      Capybara.current_driver = Capybara.javascript_driver
    else
      Capybara.current_driver = Capybara.default_driver
    end
  end

  test 'without js' do
    # write test without js
  end

  test 'with js', js: true do
    # write test with js
  end
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activesupport-testing-metadata'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activesupport-testing-metadata

## Contributing

1. Fork it ( https://github.com/y-yagi/activesupport-testing-metadata/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
