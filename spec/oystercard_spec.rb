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

  it 'deducts the fare from balance' do
    expect(subject).to respond_to(:deduct).with(1).argument
  end

  it 'deducts the fare from balance' do
    subject.top_up(41)
    subject.deduct(11)
    expect(subject.balance).to eq 30
  end

  describe '#in_journey' do
    it 'initially not in journey' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'lets customer enter' do
      subject.top_up(41)
      subject.touch_in(:station)
      expect{subject.touch_in(:station)}.to change {subject.in_journey?}.to eq (true)
    end
  end
end
