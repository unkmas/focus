require 'spec_helper'

describe Focus::Response::Company do
  let(:company) { described_class.build(attributes) }
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

  it { expect(company).to be_a Focus::Response::LegalCompany }
  it { expect(company.inn).to  eq '1111' }
  it { expect(company.ogrn).to eq '2222' }
  it { expect(company.name).to be_a Focus::Response::LegalCompany::Name }
  it { expect(company.name.short).to eq 'ООО Порося' }

  describe '.build' do
    context 'when it is legal company attributes' do
      let(:attributes) { {'UL' => {}} }

      it { expect(company).to be_a Focus::Response::LegalCompany }
    end

    context 'when it is entrepreneur attributes' do
      let(:attributes) { {'IP' => {}} }

      it { expect(company).to be_a Focus::Response::Entrepreneur }
    end
  end
end
