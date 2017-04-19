require 'oystercard'

describe Oystercard do

  subject {Oystercard.new}
  let(:max_limit) {Oystercard::MAX_LIMIT}
  let(:fare) {Oystercard::FARE}
  let(:station) { double :station }

    it 'checks if a new card has a balance of 0' do
    expect(subject.balance).to eq 0
    end

    describe '#top_up' do
    it 'tops up a card' do
    expect {subject.top_up 1}.to change {subject.balance}.by 1
    end

    it 'raises exception when balance exceeds limit' do
    expect {subject.top_up(max_limit+1)}.to raise_error "The balance exceeds the #{max_limit} limit"
    end
    end

context 'it uses max top_up' do
    before {subject.top_up(max_limit)}
    before {subject.touch_in(station)}
    
    describe '#touch_in' do
    it 'changes the state of the card to be in use' do
      expect(subject.entry_station).to eq station
    end
    it 'remember entry station after touch in' do
      expect(subject.entry_station).to eq station
    end
    end

    describe '#in_journey?' do
    it 'checks if a customer who touched in is in journey' do
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
        expect(subject.entry_station).to eq nil
      end
      it 'deducts fare when card touches out' do
       expect {subject.touch_out}.to change {subject.balance}.by(-fare)
       end
     end

end

context 'it does not require a top_up' do
    describe '#touch_in' do
      it 'throws and error if balance is bellow minimum at touch in' do
      expect {subject.touch_in(station)}.to raise_error 'Insufficient funds'
      end
    end
 end

end
