require 'oystercard'
describe Oystercard do

it 'checks if a new card has a balance of 0' do
  card = Oystercard.new
  expect(card.balance).to eq 0
end

end
