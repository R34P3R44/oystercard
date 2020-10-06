# can hold credit to allow users to pay for public transport use

class Oystercard
 
  attr_reader :balance
  MAX_VALUE = 90
  
  def initialize
    @balance = 0
  end

<<<<<<< HEAD
  def top_up
=======
  def top_up(amount) 
    raise "Cannot top-up: Balance cannot be over £90" if max_credit?(amount)
    @balance += amount
  end

  private
  
  def max_credit?(amount)
    @balance + amount > 90
>>>>>>> 61987e4a5e044f5e20595a0ad5a4973b4a28b630
  end
end
