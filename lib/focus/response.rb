require_relative 'response/company'

module Focus
  class Response
    attr_reader :companies

    def initialize(response)
      @companies = []

      response.each do |company|
        @companies << build_company(company)
      end
    end

    private

    def build_company(company_attributes)
      Company.new(company_attributes)
    end
  end
end