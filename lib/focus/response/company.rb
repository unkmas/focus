require_relative 'company/name'

module Focus
  class Response
    class Company
      attr_reader :inn, :ogrn, :name

      def initialize(attributes)
        build_requisites(attributes)
      end

      private

      def build_requisites(attributes)
        @inn  = attributes['inn']
        @ogrn = attributes['ogrn']
        @name = Name.new(attributes['UL']['legalName'])
      end
    end
  end
end