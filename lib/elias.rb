require 'faraday'
require 'faraday_middleware'
require 'hashie'

require_relative 'elias/parks'
require_relative 'elias/attraction'

module Elias
  class Client
    attr_accessor :client

    def initialize(options = {})
      @client = options

      self.connect!
    end

    def connect!(token = nil)
      @@connection = Faraday.new(:url => "https://touringplans.com") do |f|
        f.use FaradayMiddleware::FollowRedirects

        f.request  :json
        f.response :json, :content_type => /\bjson$/

        f.adapter :net_http
      end

      self
    end

    def self.connection
      @@connection
    end

    def park
      Elias::Park
    end
  end
end
