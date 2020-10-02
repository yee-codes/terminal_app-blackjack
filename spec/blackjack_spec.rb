require_relative '../blackjack'

RSpec.describe Game do
    it 'should have correct total' do
        sum = Game.new
        expect(sum.cards_total_value([10, 10])).to eq(20)
    end

    it 'should have a card numbered 2..11' do
        card = Game.new
        expect(card.dealer_cards).to eq(8)
    end
end

