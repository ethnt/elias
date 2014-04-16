require 'faraday'
require 'faraday_middleware'
require 'hashie'

require_relative 'elias/resort'
require_relative 'elias/park'
require_relative 'elias/attraction'
require_relative 'elias/dining'

module Elias
  RESORTS = ['walt-disney-world', 'disneyland-resort', 'universal-orlando']

  class Client
    attr_accessor :client

    def initialize(options = {})
      @client = options

      self.connect!
    end

    def connect!(token = nil)
      @@connection = Faraday.new(:url => "http://touringplans.com") do |f|
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

    def resort
      Elias::Resort
    end
  end
end
