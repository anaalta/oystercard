
class Oystercard

MAX_LIMIT = 90
FARE = 1

attr_reader :balance, :status

  def initialize
    @balance = 0
    @status = false
  end

  def top_up(amount)
    fail "The balance exceeds the #{Oystercard::MAX_LIMIT} limit" if @balance+amount > MAX_LIMIT
    @balance += amount
  end

  def deduct
    @balance -= FARE
  end

  def touch_in
    fail 'Insufficient funds' if @balance < FARE
    @status=true
  end

  def in_journey?
    @status
  end

  def touch_out
    @status=false
    deduct
  end


end
