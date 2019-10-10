require 'oystercard'
require 'station'
require 'journey'
require 'journey_log'

describe Station do

  subject {described_class.new("Old Street", 1)}

  it 'has a name variable' do
    expect(subject.name).to eq("Old Street")
  end

  it 'has a zone variable' do
    expect(subject.zone).to eq(1)
  end

end
