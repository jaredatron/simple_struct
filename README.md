# SimpleStruct

SimpleStruct is a lighter weight struct then ruby's standard struct in that it doest not include Enumerable.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_struct'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_struct

## Usage

    class Car < SimpleStruct.new(:color, :size)
    end

    # or

    Car = SimpleStruct.new(:color, :size) do
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
