module Focus
  class Response
    class Entrepreneur < Company
      def entrepreneur?
        true
      end

      private

      def build_requisites(attributes)
        super
        @requisites.assign_attributes(attributes['IP'])
      end
    end
  end
end
