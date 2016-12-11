require 'spec_helper'

describe Focus::Response::Company::Name do
  let(:name) { described_class.new(attributes) }
  let(:attributes) do
    {
      'full'  => 'Общество с ограниченной ответственностью "Порося"',
      'short' => 'ООО Порося'
    }
  end

  it { expect(name.short).to eq 'ООО Порося' }
  it { expect(name.full).to  eq 'Общество с ограниченной ответственностью "Порося"' }
  it { expect(name.to_s).to  eq 'Общество с ограниченной ответственностью "Порося"' }

  context 'when short name is blank' do

    let(:attributes) do
      {
        'full'  => 'Общество с ограниченной ответственностью "Порося"',
        'short' => ''
      }
    end

    it { expect(name.short).to eq 'Общество с ограниченной ответственностью "Порося"' }
    it { expect(name.full).to  eq 'Общество с ограниченной ответственностью "Порося"' }
    it { expect(name.to_s).to  eq 'Общество с ограниченной ответственностью "Порося"' }
  end
end