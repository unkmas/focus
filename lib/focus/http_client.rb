require 'net/http'
require 'json'
require_relative 'http_client/error_handler'

module Focus
  class HttpClient
    attr_reader :api_key

    BASE_URL = "https://focus-api.kontur.ru/api#{API_VERSION}/".freeze

    def initialize(api_key)
      @api_key = api_key
    end

    def get(method:, **params)
      response = Net::HTTP.get_response url(method: method, **params)

      error_handler.check_response(response) do |clean_response|
        parse(clean_response)
      end
    end

    private

    def url(method:, **params)
      url = URI.join(BASE_URL, method)
      url.query = build_query(params)

      url
    end

    def build_query(params)
      base_params = [['key', api_key]]
      base_params += (params || []).to_a

      URI.encode_www_form(base_params)
    end

    def parse(response)
      Response.new JSON.parse(response.body)
    end

    def error_handler
      ErrorHandler.new
    end
  end
end
