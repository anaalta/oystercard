
class Oystercard

MAX_LIMIT = 90
FARE = 1

attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @entry_station = []
    @exit_station = []
    @journeys = {}
  end

  def top_up(amount)
    fail "The balance exceeds the #{Oystercard::MAX_LIMIT} limit" if @balance+amount > MAX_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail 'Insufficient funds' if @balance < FARE
    @entry_station << station
  end

  def in_journey?
    !!entry_station
  end


  def touch_out(station)
    deduct
    @exit_station << station
    @journeys = Hash[@entry_station.zip @exit_station]
  end



  private

  def deduct
    @balance -= FARE
  end


end
