# Config Toys

![Cirrus CI - Base Branch Build Status](https://img.shields.io/cirrus/github/AlexWayfer/config_toys?style=flat-square)
[![Codecov branch](https://img.shields.io/codecov/c/github/AlexWayfer/config_toys/master.svg?style=flat-square)](https://codecov.io/gh/AlexWayfer/config_toys)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/AlexWayfer/config_toys.svg?style=flat-square)](https://codeclimate.com/github/AlexWayfer/config_toys)
![Depfu](https://img.shields.io/depfu/AlexWayfer/config_toys?style=flat-square)
[![Inline docs](https://inch-ci.org/github/AlexWayfer/config_toys.svg?branch=master)](https://inch-ci.org/github/AlexWayfer/config_toys)
[![license](https://img.shields.io/github/license/AlexWayfer/config_toys.svg?style=flat-square)](https://github.com/AlexWayfer/config_toys/blob/master/LICENSE.txt)
[![Gem](https://img.shields.io/gem/v/config_toys.svg?style=flat-square)](https://rubygems.org/gems/config_toys)

Toys template for applications configuration,
like [Flame](https://github.com/AlexWayfer/flame), but not necessarily.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'config_toys'
```

And then execute:

```shell
bundle install
```

Or install it yourself as:

```shell
gem install config_toys
```

## Usage

```ruby
## .toys/.toys.rb
require 'config_toys'
## `:config_dir` can be a String or a Proc, default is `-> { "#{context_directory}/config" }`
expand ConfigToys::Template, config_dir: "#{__dir__}/../config"
```

## Development

After checking out the repo, run `bundle install` to install dependencies.

Then, run `toys rspec` to run the tests.

To install this gem onto your local machine, run `toys gem install`.

To release a new version, run `toys gem release %version%`.
See how it works [here](https://github.com/AlexWayfer/gem_toys#release).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/AlexWayfer/config_toys).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
