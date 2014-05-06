# Elias

Elias (as in Walter Elias Disney) is a Ruby library for interacting with the [TouringPlans.com](http://touringplans.com) [API](http://touringplans.com/api). It can give you information about the Disney parks their attractions, dining establishments, and hotels.

## Usage

```ruby
e = Elias::Client.new

e.resorts # => [ Elias::Resort, Elias::Resort ]
e.resorts.first # => [ Elias::Resort ]
e.resorts.first.parks # => [ Elias::Park, Elias::Park ]
e.resorts.first.hotels # => [ Elias::Hotel, Elias::Hotel ]

mk = e.resorts.first.parks.first # => Elias::Park
mk.attractions # => [ Elias::Attraction, Elias::Attraction ]
mk.dining  # => [ Elias::Dining, Elias::Dining ]
```

## Future Features

- Menus from restaurants. Touring Plans has an API for it, but the endpoints are too varied to program efficiently.
- Showtimes for parks. Again, there's an API for this, but it returns invalid JSON.
- Querying based on data (e.g., `e.resorts.where(permalink: 'walt-disney-world').hotels.where(name: 'Disney\'s Pop Century Resort').info`)
- Testing
