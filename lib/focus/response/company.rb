module Focus
  class Response
    class Company
      attr_reader :inn, :ogrn, :name

      def self.build(attributes)
        if attributes['IP']
          Entrepreneur.new(attributes)
        else
          LegalCompany.new(attributes)
        end
      end

      def initialize(attributes)
        build_requisites(attributes)
      end

      private

      def build_requisites(attributes)
        @inn  = attributes['inn']
        @ogrn = attributes['ogrn']
      end
    end
  end
end
