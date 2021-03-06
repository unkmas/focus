module Focus
  class HttpClient
    InvalidApiKey = Class.new(StandardError)
    UnknownError  = Class.new(StandardError)

    class ErrorHandler
      def check_response(response)
        case response
        when Net::HTTPSuccess
          yield response
        when Net::HTTPBadRequest
          response.body = '{}'
          yield response
        else
          raise_error(response)
        end
      end

      private

      def raise_error(response)
        case response
        when Net::HTTPForbidden
          raise InvalidApiKey.new
        else
          raise UnknownError.new(response.body)
        end
      end
    end
  end
end
