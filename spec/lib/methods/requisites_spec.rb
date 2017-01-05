require 'spec_helper'

describe Focus::Methods::Requisites do
  let(:http_client) { double :http_client }
  let(:requisites) { described_class.new(http_client) }

  it { expect(requisites.class.method_name).to eq 'req' }

  describe '#get' do
    let(:get) { requisites.get(**attributes) }

    context 'when everything is ok' do
      let(:attributes) do
        {inn: 'company1_inn', ogrn: ['company2_ogrn', 'company3_ogrn']}
      end

      let(:converted) do
        {method: 'req', inn: 'company1_inn', ogrn: 'company2_ogrn,company3_ogrn'}
      end

      after { get }

      it { expect(http_client).to receive(:get).with(converted) }
    end

    context 'when no requisites passed' do
      let(:attributes) do
        {}
      end

      it { expect { get }.to raise_error(ArgumentError) }
    end
  end
end
