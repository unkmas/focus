require_relative 'company/requisites'
module Focus
  class Response
    class Company
      extend Forwardable

      attr_reader :name, :requisites

      def_delegators :@requisites, *Requisites::FIELDS

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
        @requisites = Requisites.new(attributes)
      end
    end
  end
end
