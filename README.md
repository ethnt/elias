# Elias

Elias (as in Walter Elias Disney) is a Ruby library for interacting with the [TouringPlans.com](http://touringplans.com) [API](http://touringplans.com/api). It can give you information about the Disney parks their attractions, dining establishments, and hotels.

## Usage

```ruby
e = Elias::Client.new

mk = e.parks.find("Magic Kingdom") # => #<Park ...>
mk.attractions # => [#<Attraction ...>, #<Attraction ...>]

wdw = e.resorts.find("Walt Disney World") # => #<Resort ...>
wdw.hotels # => [#<Hotel ...>]
wdw.hotels.dining # => [#<Restaurant ...>]

floridian = wdw.hotels.find("grand-floridian") # => #<Hotel ...>
floridian.off_site? # => false
```
