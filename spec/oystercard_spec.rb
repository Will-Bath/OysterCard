# frozen_string_literal: true

require 'oystercard'

describe OysterCard do
  it 'can check balance on card is 0' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument } # checking if top_up method has 1 variable within it

    it 'can add funds to balance' do

      subject.top_up(20)
      expect(subject.balance).to eq(20)
    end

    it 'prevents topping up if balance is at max balance' do
      max_balance = OysterCard::MAX_BALANCE
      subject.top_up(max_balance)
      expect { subject.top_up(1) }.to raise_error 'Balance will exceed limit'
    end

    it 'prevents topping up if the end balance will be above max' do
      subject.top_up(70)
      expect { subject.top_up(25) }.to raise_error 'Balance will exceed limit'
    end
  end
  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts an amount from the balance' do
      subject.top_up(20)
      subject.deduct(5)

      expect(subject.balance).to eq(15)
    end
  end

  describe '#in_journey?' do
    it { is_expected.to respond_to(:in_journey?) }
  end

  describe 'touch_in' do
    # it { is_expected.to respond_to(:touch_in) }

    it 'Changes status in_journey to true when touching in' do
      subject.top_up(10)
      subject.touch_in
      expect(subject.in_journey?).to eq(true)
    end

    it 'Will not allow touch in if balance is less than 1' do
      min_balance = OysterCard::MIN_BALANCE
      expect{ subject.touch_in }.to raise_error "Balance is below £#{min_balance}; you can not travel"
    end
  end

  describe 'touch_out' do
    it { is_expected.to respond_to(:touch_out) }

    it 'Changes status in_journey to false when touching out' do
      subject.touch_out
      expect(subject.in_journey?).to eq(false)
    end

    it 'deducts the correct amount from the card' do
      min_charge = OysterCard::MIN_CHARGE
      subject.top_up(min_charge + 1)
      subject.touch_in
      expect { subject.touch_out }.to change { subject.balance }.by(-min_charge)
    end
  end
end
