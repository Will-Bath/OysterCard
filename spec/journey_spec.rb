require 'oystercard'
require 'station'
require 'journey'
require 'journey_log'

describe Journey do

  let(:station1) { Station.new("Old Street", 1) }
  let(:station2) { Station.new("New Street", 2) }

  context 'journey initialization' do
    subject {described_class.new}

    it 'stores entry station' do
      subject.change_entry(station1)
      expect(subject.entry_station).to eq(station1)
    end

    it 'stores exit station' do
      subject.change_exit(station2)
      expect(subject.exit_station).to eq(station2)
    end
  end

  subject {described_class.new}

  it 'charges max fare if touch in is empty' do
    subject.change_entry(station1)
    expect(subject.fare).to eq(6)
  end
end
