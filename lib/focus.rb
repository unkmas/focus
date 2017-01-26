require_relative 'focus/version'
require_relative 'focus/methods'
require_relative 'focus/http_client'
require_relative 'focus/response'
require_relative 'focus/response/company'
require_relative 'focus/response/legal_company'
require_relative 'focus/response/legal_company/name'
require_relative 'focus/response/entrepreneur'

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
