module Elias
  class Resort
    def initialize(data = {})
      data.each do |k, v|
        instance_variable_set("@#{k}", v)
        instance_eval "def #{k}() @#{k} end"
      end
    end

    class << self
      def all
        resorts = []

        resorts << Elias::Resort.new(
          name: 'Walt Disney World',
          permalink: 'walt-disney-world',
          parks: [
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
        )

        resorts << Elias::Resort.new(
          name: 'Disneyland Resort',
          permalink: 'disneyland-resort',
          parks: [
            Elias::Park.new(
              name: 'Disneyland',
              permalink: 'disneyland'
            ),
            Elias::Park.new(
              name: 'Disney\'s California Adventure',
              permalink: 'disney-california-adventure'
            )
          ]
        )

        resorts << Elias::Resort.new(
          name: 'Universal Orlando',
          permalink: 'universal-orlando',
          parks: [
            Elias::Park.new(
              name: 'Universal Studios Florida',
              permalink: 'universal-studios-florida'
            ),
            Elias::Park.new(
              name: 'Islands of Adventure',
              permalink: 'islands-of-adventure'
            )
          ]
        )

        resorts
      end
    end
  end
end
