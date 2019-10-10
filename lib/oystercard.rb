# frozen_string_literal: true

class OysterCard
  attr_accessor :journey_log
  attr_reader :balance, :entry_station, :exit_station
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station
    @exit_station
    @journey_log = Journey_Log.new
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
    @journey_log.start(@entry_station)
    if journey_log.charge > 0
      deduct(@journey_log.charge)
    end
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    @journey_log.finish(@exit_station)
    deduct(@journey_log.charge)
  end

  def in_journey?
    !!entry_station
  end
end
