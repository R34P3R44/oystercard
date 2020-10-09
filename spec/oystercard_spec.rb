require 'oystercard.rb'

describe Oystercard do
  it 'starts with the balance of zero' do
    expect(subject.balance).to eq 0
  end

  it 'customer can top up' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'tops up the balance' do
    subject.top_up(5)
    expect(subject.balance).to eq 5
  end

  it 'raises error if limit exceeded' do
    expect{subject.top_up(91)}.to raise_error "Error, top up limit is #{Oystercard::LIMIT}"
  end

  ## Removed these tests to be able to make deduct a private method.
  # it 'deducts the fare from balance' do
  #   expect(subject).to respond_to(:deduct).with(1).argument
  # end

  # it 'deducts the fare from balance' do
  #   subject.top_up(41)
  #   #subject.deduct(11)
  #   expect(subject.balance).to eq 30
  # end

  describe '#in_journey' do
    it 'initially not in journey' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#entry_station' do
    it 'returns entry station if touched in' do
      subject.top_up(4)
      subject.touch_in(:station)
      expect(subject.entry_station).to eq :station
    end

    it 'returns false if touched out' do
      subject.top_up(4)
      subject.touch_in(:station)
      subject.touch_out("exit_station")
      expect(subject.entry_station).to eq nil
    end
  end

  describe '#touch_in' do
    it 'lets customer enter' do
      subject.top_up(4)
      expect{ subject.touch_in(:station) }.to change { subject.in_journey? }.to(true)
    end

    it 'raises error if balance is less than 1' do
      expect{subject.touch_in(:station)}.to raise_error "Error, balance is below £#{Oystercard::MINIMUM}"
    end

    it 'checks if #travel_history array is empty' do
      expect(subject.travel_history.empty?).to eq true
    end
  end

  describe '#touch_out' do
    it 'lets customer exit' do
      subject.top_up(3)
      subject.touch_in(:station)
      expect{ subject.touch_out("exit_station") }.to change { subject.in_journey? }.to(false)
    end

    it 'deducts the correct fare' do
      subject.top_up(4)
      subject.touch_in(:station)
      expect{ subject.touch_out("exit_station") }.to change { subject.balance }.by(-Oystercard::MINIMUM)
    end

    it 'checks touch_out responds to 1 argument' do
      expect(subject).to respond_to(:touch_out).with(1).argument
    end
  end
end
