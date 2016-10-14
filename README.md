# Wetsy

Wetsy is a CSS framework aiming to eliminate duplicated css styles. It believes **you should not have things like `width: 100%;` twice in your stylesheet**. And to do that, you should group all your selectors together and set their width to 100%.

Sure, this will give you duplicated selectors instead of duplicated styles so you may be thinking that **we enjoy typing selectors, yeah?** But we don't. Instead of typing selectors, we enjoy using SASS extends and placeholders to generate those selectors for us.

That gave us another, rather unexpected ideology which is **You should not override styles with more specific selectors.. ever**. This is quite strong opinion but the nature of SASS extends does not leave us with any other choice than to believe in and preach this 2nd ideology. Well, let's see how it goes.

To get a better idea on what Wetsy actually does, have a look at this:

![Wetsy example](https://i.snag.gy/iQOkh2.jpg)

See? You will never have more than one style for a selector or a group of selectors. Isn't that beautiful? Event if not, it sure is wetsy.

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

Using Normalize and Autoprefixer together with Wetsy is strongly recommended.

### Modifying settings

Wetsy comes with some default settings like colors, fonts etc. You can override those defaults by adding your own settings and importing them **prior** to wetsy.scss. For example, if you want to change default colors and your application.scss looks like this:

    @import "normalize-rails";
    @import "wetsy";
    @import "your_custom_components/*";
    
You should create 'settings/_colors.scss' file and change your application.scss to:

    @import "normalize-rails";
    @import "settings/colors"; // imported before wetsy.scss
    @import "wetsy";
    @import "your_custom_components/*";
    
Then you just assign desired values to color variables. For example, this will update your color-warning:

    $color-warning: #FFB400;

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mizurnix/wetsy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

