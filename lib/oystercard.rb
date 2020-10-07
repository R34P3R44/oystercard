# can hold credit to allow users to pay for public transport use

class Oystercard

  attr_reader :balance, :entry_station

  LIMIT = 90

  def initialize
    @balance = 0
    @entry_station = false
  end

  def top_up(money)
    raise "Error, top up limit is #{LIMIT}" if @balance + money > 90
    @balance = @balance + money
  end

  def deduct(fare)
    @balance = @balance - fare
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    !!@entry_station = station
  end

  def touch_out
  end
end
