require 'spec_helper'

describe Focus::HttpClient do
  let(:client) { described_class.new('some-api-key') }

  describe '#get' do
    let(:get) { client.get(params) }
    let(:params) { {method:'method', foo: :bar} }
    let(:url) { %r{https://focus-api.kontur.ru/api3/method.*} }

    before { stub_request(:get, url).to_return(response) }

    context 'when everything is ok' do
      let(:response) do
        {
          status: 200,
          body: [{UL: {legalName: {full: 'foo'}}}].to_json
        }
      end

      it { expect(get.first).to be_a Focus::Response::Company }
      it { expect(get.first.name.to_s).to eq 'foo' }
    end

    context 'when api key is bad' do
      let(:response) do
        {status: 403}
      end

      it { expect { get }.to raise_error(Focus::HttpClient::InvalidApiKey) }
    end

    context 'when we passed invalid data' do
      let(:response) do
        {status: 400}
      end

      it { expect { get }.not_to raise_error }
      it { expect(get.count).to be 0 }
    end

    context 'when there is another error' do
      let(:response) do
        {status: 500, body: 'Fuck you!'}
      end

      it { expect { get }.to raise_error(Focus::HttpClient::UnknownError) }
      it { expect { get }.to raise_error('Fuck you!') }
    end
  end
end
