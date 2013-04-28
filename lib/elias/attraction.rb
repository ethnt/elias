module Elias
  class Attraction < Hash
    include Hashie::Extensions::MethodAccess

    def more
      Elias::Client.connection.get("magic-kingdom/attractions/#{permalink}.json").body
    end
  end
end
