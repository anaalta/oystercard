
class Oystercard

MAX_LIMIT = 90

attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "The balance exceeds the #{Oystercard::MAX_LIMIT} limit" if @balance+amount > MAX_LIMIT
    @balance = @balance += amount
  end

  def deduct(deduction)
    @balance -= deduction
  end

end
