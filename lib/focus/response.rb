require_relative 'response/company'

module Focus
  class Response
    include Enumerable

    attr_reader :companies

    def initialize(response)
      @companies = []

      response.each do |company_attributes|
        @companies << build_company(company_attributes)
      end
    end

    def each
      @companies.each {|company| yield company }
    end

    def [](inn)
      select {|company| company.inn == inn }.first
    end

    private

    def build_company(company_attributes)
      Company.build(company_attributes)
    end
  end
end
