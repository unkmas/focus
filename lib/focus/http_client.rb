module Focus
  class HttpClient
    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end
  end
end