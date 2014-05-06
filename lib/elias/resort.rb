module Elias
  class Resort
    def initialize(data = {})
      data.each do |k, v|
        instance_variable_set("@#{k}", v)
        instance_eval "def #{k}() @#{k} end"
      end
    end

    def parks
      case self.permalink
      when 'walt-disney-world'
        return [
          Elias::Park.new(
            name: 'Magic Kingdom',
            permalink: 'magic-kingdom'
          ),
          Elias::Park.new(
            name: 'Epcot',
            permalink: 'epcot'
          ),
          Elias::Park.new(
            name: 'Disney\'s Hollywood Studios',
            permalink: 'hollywood-studios'
          ),
          Elias::Park.new(
            name: 'Disney\'s Animal Kingdom',
            permalink: 'animal-kingdom'
          ),
          Elias::Park.new(
            name: 'Typhoon Lagoon',
            permalink: 'typhoon-lagoon'
          ),
          Elias::Park.new(
            name: 'Blizzard Beach',
            permalink: 'blizzard-beach'
          )
        ]
      when 'disneyland-resort'
        return [
          Elias::Park.new(
            name: 'Disneyland',
            permalink: 'disneyland'
          ),
          Elias::Park.new(
            name: 'Disney\'s California Adventure',
            permalink: 'disney-california-adventure'
          )
        ]
      when 'universal-orlando'
        return [
          Elias::Park.new(
            name: 'Universal Studios Florida',
            permalink: 'universal-studios-florida'
          ),
          Elias::Park.new(
            name: 'Islands of Adventure',
            permalink: 'islands-of-adventure'
          )
        ]
      end
    end

    def hotels
      body = Elias::Client.connection.get("#{self.permalink}/hotels.json").body

      hotels = []
      body.each do |level|
        level[1].each do |hotel|
          hotel = hotel.merge({ resort: self, tier: level[0] })

          hotels << Elias::Hotel.new(hotel)
        end
      end

      hotels
    end
  end
end
