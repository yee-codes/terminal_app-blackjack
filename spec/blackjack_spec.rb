require_relative '../src/blackjack.rb'

RSpec.describe Game do
    # Feature being tested: ensuring the method (cards_total_value(cards) in blackjack.rb) that calculates cards 
    # total is accurate.
    # Passing an array consists of two cards: 10 and 10. The expected result is a sum of 20.
    it 'should have correct total' do
        sum = Game.new
        expect(sum.cards_total_value([10, 10])).to eq(20)
    end

    # Feature/function (dealer_cards in blackjack.rb) being tested: ensuring one random card is drawn from a deck
    # of cards.
    # The value of the random card should be within the range of 2 to 11.
    it 'should have a card numbered in 2..11' do
        card = Game.new
        expect(card.dealer_cards).to eq(8)
    end
end