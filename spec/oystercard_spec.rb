require 'oystercard'
describe Oystercard do

  it 'checks if a new card has a balance of 0' do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end

  describe '#top_up' do
    it 'tops up a card' do
    expect(subject.top_up(3)).to eq (3)
    expect {subject.top_up 1}.to change {subject.balance}.by 1
  end

    it 'raises exception when balance exceeds limit' do
    expect {subject.top_up(Oystercard::MAX_LIMIT+1)}.to raise_error "The balance exceeds the #{Oystercard::MAX_LIMIT} limit"
  end
end

end
