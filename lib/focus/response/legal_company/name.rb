module Focus
  class Response
    class LegalCompany::Name
        attr_accessor :short, :full

        def initialize(attributes)
          @full  = attributes['full']
          @short = attributes['short']
          @short = full if short.nil? || short.empty?
        end

        def to_s
          full
        end
    end
  end
end
