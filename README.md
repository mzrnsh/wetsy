# Wetsy

Wetsy is a CSS framework aiming to eliminate duplicated css styles. It believes **you should not have things like `width: 100%;` twice in your stylesheet**. And to do that, you should group all your selectors that need to have full width and set their width to 100%.

Sure, this will give you duplicated selectors instead of duplicated styles and you may be thinking that **we enjoy typing selectors, yeah?** But we don't. Instead of typing selectors, we enjoy using SASS extends to generate those selectors for us.

Relying on extends comes with a price - you no longer control which style comes first in your compiled stylesheet, which is not an entirely bad thing - this pushes you to structure your stylesheets in a way that only selector specificity (and not location) defines which styles to appy to a certain element. On the other hand, as of now we have not found a Wetsy-way to deal with fallbacks (for example, you may be using calc() to set width for an element, but want to support ancient browsers so you define width in pixels as well).

To get a better idea on what Wetsy actually does, have a look at an

## Example

Let's assume you have following HTML:

```html
<div class="button-success">
  Push me
</div>
``` 

and your div needs to have `width: 100%;`  `background-color: #34a853;` and `border-radius: 2px`.

Your css would probably look like this:

```css
.button-success {
  width: 100%;
  background-color: #34a853;
  border-radius: 2px;
}
```

If you are using SASS or some other preprocessor, you may have something like this:

```scss
.button-success {
  width: 100%;
  background-color: $success;
  border-radius: $button-border-radius;
}
```
which compiles to previous CSS snippet.

----

With Wetsy your compiled CSS will look similar to this:

```css
body,
main,
.container,
.header,
.button-success,
.some-other-full-width-element,
.etc {
  width: 100%;
}

.button-success,
.message-success,
.some-other-successful-thing,
.etc {
  background-color: #34a853;
}

.button-default,
.button-success,
.button-warning,
.button-disabled,
.some-other-round-cornered-box,
.etc {
  border-radius: 2px;
}
```
And now the interesting part.. That CSS is compiled from this SCSS:

```scss
/* Some other selectors here */

.button-success {
  @extend %width__100pct;
  @extend %background-color__success;
  @extend %boder-radius__2px;
}

/* Even more selectors here */
```
Let's have another look on what Wetsy gives you (this time a screenshot from a live website):

![Wetsy example](https://i.snag.gy/iQOkh2.jpg)

See? You will never have more than one style for a selector or a group of selectors. Isn't that beautiful? Event if not, it sure is Wetsy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wetsy', git: 'https://github.com/mizurnix/wetsy.git'
```

And then execute:
```shell
bundle install
```

## Usage

After installing the gem, import `wetsy.scss` into `application.scss`:

```scss
@import "wetsy"
```        
Then import your own styles. If you wanna work clean, the Wetsy-way, ideally you should never write selector-specific styles s in your stylesheets - instead extend your selectors with existing wetsy-placeholders.

Even when you need a style like `font-size: 94.3pt`, which obviously is not (yet) available as a wetsy placeholder, instead of directly using that style with your selector, create your own placeholder:

```scss    
%font-size--94_3pt {
  font-size: 94.3pt;
}
```
And extend that placeholder from your selector:

```scss
.my-weird-selector-that-needs-weird-font-size {
  @extend %font-size--94_3pt;
}
```

TODO - We don't have a convention on how to structure custom placeholders yet. Just add it somewhere in your stylesheets directory for now. At least that's what I do.

Using Normalize and Autoprefixer together with Wetsy is strongly recommended.

### Modifying default settings

Wetsy comes with some default settings like colors, fonts etc. You can override those defaults by adding your own settings and importing them **prior** to wetsy.scss. For example, if you want to change default colors and your application.scss looks like this:

```scss
  @import "normalize-rails";
  @import "wetsy";
  @import "your_custom_components/*";
```    

You should create `settings/_colors.scss` file and change your application.scss to:

```scss
  @import "normalize-rails";
  @import "settings/colors"; // imported before wetsy.scss
  @import "wetsy";
  @import "your_custom_components/*";
```

Then you assign desired values to wetsy color variables in your `settings/_colors.scss` file:

```scss
  $color-warning: #FFB400;
```

This will override default warning color.    

## Development - TODO

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mizurnix/wetsy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
