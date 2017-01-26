module Focus
  class Response
    class Company
      class Requisites
        FIELDS = %i[
          inn ogrn kpp okpo okato okfs oktmo
          okogu okopf opf registration_date dissolution_date
        ].freeze

        attr_reader *FIELDS

        def initialize(attributes = {})
          assign_attributes(attributes)
        end

        def assign_attributes(attributes)
          FIELDS.each do |field|
            next unless attributes[field.to_s]

            instance_variable_set('@' + field.to_s, attributes[field.to_s])
          end
        end
      end
    end
  end
end
