module Focus
  module Methods
    class Requisites < Base
      method 'req'.freeze

      private

      def prepare_query(inn: nil, ogrn: nil)
        inn =  [inn].compact.flatten.join(',')
        ogrn = [ogrn].compact.flatten.join(',')

        query = {}
        query[:inn]  = inn unless inn.empty?
        query[:ogrn] = ogrn unless ogrn.empty?

        raise ArgumentError if query.empty?

        query
      end
    end
  end
end
