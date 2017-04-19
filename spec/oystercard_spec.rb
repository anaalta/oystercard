require 'oystercard'

describe Oystercard do

  subject {Oystercard.new}

    it 'checks if a new card has a balance of 0' do
    expect(subject.balance).to eq 0
    end

    describe '#top_up' do

    it 'tops up a card' do
    expect {subject.top_up 1}.to change {subject.balance}.by 1
    end

    it 'raises exception when balance exceeds limit' do
    expect {subject.top_up(Oystercard::MAX_LIMIT+1)}.to raise_error "The balance exceeds the #{Oystercard::MAX_LIMIT} limit"
    end
   end

  describe '#deduct' do
    before {subject.top_up(Oystercard::MAX_LIMIT)}
    it 'deducts a single journey fare from the card' do
      expect(subject.deduct).to eq (subject.balance)
    end
  end


  describe '#touch_in' do
  it 'changes the state of the card to be in use' do
    subject.top_up(Oystercard::MAX_LIMIT)
    subject.touch_in
    expect(subject.status).to eq true
  end
    it 'throws and error if balance is bellow minimum at touch in' do
      expect {subject.touch_in}.to raise_error 'Insufficient funds'
    end
  end

  describe '#in_journey?' do
    it 'checks if a customer who touched in is in journey' do
    subject.top_up(Oystercard::MAX_LIMIT)
    subject.touch_in
    expect(subject).to be_in_journey
    end

    it 'checks if a customer who touched out is out of journey' do
    subject.touch_out
    expect(subject).not_to be_in_journey
    end
  end

  describe '#touch_out' do
    it 'changes the state of a card to be out of use' do
      subject.touch_out
      expect(subject.status).to eq false
    end

    it 'deducts fare when card touchs out' do
      expect {subject.touch_out}.to change{subject.balance}.by(-Oystercard::FARE)
    end
  end
end
