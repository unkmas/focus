module Focus
  module Methods
    class Base
      attr_reader :http_client

      def initialize(http_client)
        @http_client = http_client
      end
    end
  end
end