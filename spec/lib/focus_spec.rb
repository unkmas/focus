require 'spec_helper'
require 'focus'

describe Focus::Client do
  let(:api_key) { 'YOUR_API_KEY' }
  let(:focus) { described_class.new(api_key) }

  it { expect(focus.requisites).to be_an_instance_of Focus::Methods::Requisites }
end