require "oystercard.rb"

describe Oystercard do
  it "starts with the balance of zero" do
    expect(subject.balance).to eq 0
  end

  it "customer can top up" do
    expect(subject.top_up).respond_to?(:top_up)
  end
end
