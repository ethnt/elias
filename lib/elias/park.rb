module Elias
  class Park
    def initialize(data = {})
      data.each do |k, v|
        instance_variable_set("@#{k}", v)
        instance_eval "def #{k}() @#{k} end"
      end
    end

    def attractions
      body = Elias::Client.connection.get("#{self.permalink}/attractions.json").body

      attractions = []
      body.each do |attraction|
        attraction = attraction.merge({ park: self })

        attractions << Elias::Attraction.new(attraction)
      end

      attractions
    end

    def dining
      body = Elias::Client.connection.get("#{self.permalink}/dining.json").body.first

      dinings = []
      body.each do |dining|
        dining = dining.merge({ park: self })

        dinings << Elias::Dining.new(dining)
      end

      dinings
    end
  end
end
