module Elias
  module Parks
    def parks
      self.class::Park
    end

    class Park
      attr_accessor :name, :permalink, :attractions

      def initialize(options = {})
        options.each do |k, v|
          instance_variable_set("@#{k}", v)
        end

        @attractions = []
        Elias::Client.connection.get("#{@permalink}/attractions.json").body.each do |a|
          @attractions << Elias::Attraction.new(a)
        end
      end

      def self.find(permalink)
        case permalink
        when 'magic-kingdom'
          name = 'Magic Kingdom'
        when 'epcot'
          name = 'Epcot'
        when 'hollywood-studios'
          name = "Disney's Hollywood Studios"
        when 'animal-kingdom'
          name = "Disney's Animal Kingdom"
        when 'disneyland'
          name = 'Disneyland Park'
        when 'disney-california-adventure'
          name = "Disney's California Adventure"
        else
          return '404'
        end

        Park.new(:name => name, :permalink => permalink)
      end
    end
  end
end
