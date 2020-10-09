# can hold credit to allow users to pay for public transport use

class Oystercard

  attr_reader :balance, :entry_station, :travel_history

  MINIMUM = 1
  LIMIT = 90

  def initialize
    @balance = 0
    @entry_station = nil
    @travel_history = []
  end

  def top_up(money)
    raise "Error, top up limit is #{LIMIT}" if @balance + money > LIMIT
    @balance = @balance + money
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    raise "Error, balance is below £#{MINIMUM}" if @balance < MINIMUM
    @entry_station = station
  end

  def touch_out(exit_station)
    @entry_station = nil
    deduct(MINIMUM)
  end

  private
    def deduct(fare)
      @balance = @balance - fare
    end
  end
