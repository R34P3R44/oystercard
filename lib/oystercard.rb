# can hold credit to allow users to pay for public transport use

class Oystercard

  attr_reader :balance

  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise "Error, top up limit is #{LIMIT}" if @balance + money > 90
    @balance = @balance + money
  end

  def deduct(fare)
  end
end
