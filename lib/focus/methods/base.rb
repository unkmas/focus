module Focus
  module Methods
    class Base
      attr_reader :http_client

      def initialize(http_client)
        @http_client = http_client
      end

      def get(**params)
        query = prepare_query(params)

        http_client.get(method: self.class.method_name, **query)
      end

      private

      class << self
        def method(method)
          @method_name = method
        end

        attr_reader :method_name
      end

      def prepare_query(**params)
        raise NotImplementedError
      end
    end
  end
end