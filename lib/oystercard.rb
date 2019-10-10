# frozen_string_literal: true

class OysterCard
  attr_accessor :journeys
  attr_reader :balance, :entry_station, :exit_station
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station
    @exit_station
    @journeys = []
  end

  def top_up(amount)
    raise 'Balance will exceed limit' if @balance >= MAX_BALANCE
    if @balance + amount > MAX_BALANCE
      raise 'Balance will exceed limit'
    else
      @balance += amount
    end
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(entry_station)
    raise "Balance is below £#{MIN_BALANCE}; you can not travel" if @balance < MIN_BALANCE

    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @exit_station = exit_station

    @journeys << Journey.new(@entry_station, @exit_station)
  end

  def in_journey?
    if entry_station == nil
      return false
    else
      return true
    end
  end
end
