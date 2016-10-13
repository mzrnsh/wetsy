# Wetsy

Wetsy is a CSS framework aiming to eliminate duplicated css styles. It believes **you should not have things like `width: 100%;` twice in your stylesheet**. And to do that, you should group all your selectors together and set their width to 100%. Sure, it will give you duplicated selectors instead of duplicated styles but

**We enjoy typing selectors, yay!.**

But we don't. So instead of typing selectors, we enjoy SASS extends with placeholders. That gave us another, rather unexpected ideology which is **You should not override styles with more specific selectors.. at all**. This is quite strong opinion but the nature of SASS extends does not leave us any choice other than to believe and preach this 2nd ideology. Well, let's see how it goes. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wetsy', git: 'https://github.com/mizurnix/wetsy.git'
```

And then execute:

    $ bundle


## Usage

After installing the gem, import wetsy.scss in your application.scss:

    @import "wetsy"
        
Then import your own styles. If you wanna work clean, the wetsy-way, you will ideally never write ant styles in your stylesheet - you should create your classes and extend them with existing placeholders. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wetsy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

