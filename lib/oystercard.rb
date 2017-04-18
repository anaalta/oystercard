
class Oystercard

MAX_LIMIT = 90

attr_reader :balance, :status

  def initialize
    @balance = 0
    @status = false
  end

  def top_up(amount)
    fail "The balance exceeds the #{Oystercard::MAX_LIMIT} limit" if @balance+amount > MAX_LIMIT
    @balance = @balance += amount
  end

  def deduct(deduction)
    @balance -= deduction
  end

  def touch_in
    @status=true
    #return 'You have touched in!'
  end

  def in_journey?
  @status
  end

  def touch_out
    @status=false
  #return 'You have touched out'
  end


end
