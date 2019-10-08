# frozen_string_literal: true

class OysterCard
  attr_accessor :in_journey
  attr_reader :balance
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_CHARGE = 1

  def initialize(balance = 0, in_journey = false)
    @balance = balance
    @in_journey = in_journey
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

  def touch_in
    raise "Balance is below £#{MIN_BALANCE}; you can not travel" if @balance < MIN_BALANCE

    @in_journey = true
  end

  def touch_out
    deduct(MIN_CHARGE)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
