# mruby-plato-application   [![Build Status](https://travis-ci.org/mruby-plato/mruby-plato-application.svg?branch=master)](https://travis-ci.org/mruby-plato/mruby-plato-application)
Plato::MrubyApplication class (standard mruby application)
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

  # ... (snip) ...

  conf.gem :git => 'https://github.com/mruby-plato/mruby-plato-machine'
  conf.gem :git => 'https://github.com/mruby-plato/mruby-plato-timer'
  conf.gem :git => 'https://github.com/mruby-plato/mruby-plato-application'
end
```

## example
```ruby
class MyApplication < Plato::MrubyApplication
  def initialize
    super
    @count = 0
    add_timer(100, Proc.new {|app| app.hoge})
  end

  def hoge
    @count += 1
    puts @count
  end
end
MyApplication.new.start
end

```

## License
under the MIT License:
- see LICENSE file
