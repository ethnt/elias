module Elias
  class Hotel
    def initialize(data = {})
      data.each do |k, v|
        instance_variable_set("@#{k}", v)
        instance_eval "def #{k}() @#{k} end"
      end
    end

    def info
      Elias::Hotel.new(Elias::Client.connection.get("#{self.resort.permalink}/hotels/#{self.permalink}.json").body)
    end
  end
end
