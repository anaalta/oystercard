
class Oystercard

MAX_LIMIT = 90
FARE = 1

attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    fail "The balance exceeds the #{Oystercard::MAX_LIMIT} limit" if @balance+amount > MAX_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail 'Insufficient funds' if @balance < FARE
    @entry_station=station
  end

  def in_journey?
    !!entry_station
  end

  def touch_out
    deduct
    @entry_station = nil
  end

  private

  def deduct
    @balance -= FARE
  end


end
