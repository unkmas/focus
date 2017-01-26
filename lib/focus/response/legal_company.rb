module Focus
  class Response
    class LegalCompany < Company
      def entrepreneur?
        false
      end

      def initialize(attributes)
        super
        build_name(attributes)
      end

      private

      def build_name(attributes)
        return unless attributes['UL']['legalName']

        @name = Name.new(attributes['UL']['legalName'])
      end
    end
  end
end
