module Focus
  class HttpClient
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
        raise 'Sonmething wierd is happened'
      end
    end
  end
end
