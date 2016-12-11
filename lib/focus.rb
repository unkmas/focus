require 'focus/version'
require 'focus/methods'
require 'focus/http_client'

module Focus
  class Client
    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def requisites
      @requisites ||= Methods::Requisites.new(http_client)
    end

    private

    def http_client
      @http_client ||= HttpClient.new(api_key)
    end
  end
end