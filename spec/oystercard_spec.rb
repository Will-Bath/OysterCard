# frozen_string_literal: true

require 'oystercard'

describe OysterCard do
  it 'can check balance on card is 0' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it {
      is_expected.to respond_to(:top_up).with(1).argument # checking if top_up method has 1 variable within it
    }
    
    it 'can add funds to balance' do
      oystercard = OysterCard.new
      oystercard.top_up(20)
      expect(oystercard.balance).to eq(20)
    end
  end
end
