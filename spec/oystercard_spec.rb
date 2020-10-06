require 'oystercard.rb'

describe Oystercard do
  it 'starts with the balance of zero' do
    expect(subject.balance).to eq 0
  end

<<<<<<< HEAD
  it "customer can top up" do
    expect(subject.top_up).respond_to?(:top_up)
=======
  describe '#top_up(value)' do
    it 'increased the oystercard balance by value' do
      expect { subject.top_up(10) }.to change { subject.balance }.by(10)
    end

    it 'raises an error if the balance is > £90' do
      expect { subject.top_up(100) }. to raise_error "Cannot top-up: Balance cannot be over £90"
  end

>>>>>>> 61987e4a5e044f5e20595a0ad5a4973b4a28b630
  end
end
