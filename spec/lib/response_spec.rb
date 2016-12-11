require 'spec_helper'

describe Focus::Response do
  let(:attributes) do
    [
      {'inn' => 'company1_inn', 'UL' => {'legalName' => {}}},
      {'inn' => 'company2_inn', 'UL' => {'legalName' => {}}}
    ]
  end
  let(:response) { described_class.new(attributes) }

  it { expect(response.first.inn).to eq 'company1_inn' }
  it { expect(response['company2_inn'].inn).to eq 'company2_inn' }
  it { expect(response.map(&:inn)).to eq %w[company1_inn company2_inn] }
end