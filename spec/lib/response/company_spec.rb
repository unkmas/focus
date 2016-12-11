require 'spec_helper'

describe Focus::Response::Company do
  let(:company) { described_class.new(attributes) }
  let(:attributes) do
    {
      'inn'  => '1111',
      'ogrn' => '2222',
      'UL' => {
        'legalName' => {
          'full'  => 'Общество с ограниченной ответственностью "Порося"',
          'short' => 'ООО Порося'
        }
      }
    }
  end

  it { expect(company.inn).to  eq '1111' }
  it { expect(company.ogrn).to eq '2222' }
  it { expect(company.name).to be_a Focus::Response::Company::Name }
  it { expect(company.name.short).to eq 'ООО Порося' }
end