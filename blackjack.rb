class Game
    def initialize
        @in_game = true
        @deck_of_cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
                          2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
                          2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
                          2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
        @player_cards = player_initial_cards
        @dealer_cards = dealer_initial_card
        game_layout
        ask_player
        gameplay
    end

    def game_layout
        @player_cards_sum = player_cards_sum(@player_cards)
        @dealer_cards_sum = dealer_cards_sum(@dealer_cards)
        puts "Player's cards: #{@player_cards}, player's total: #{@player_cards_sum}."
        puts "Dealer's cards: #{@dealer_cards}, dealer's total: #{@dealer_cards_sum}."
        if @player_cards_sum == 21
            puts 'BOOM! BLACKJACK! YOU WIN!'
            game_over
        end
    end

    def ask_player
        puts "Would you like to 'Hit' (h) or 'Stand' (s)?"
    end

    def gameplay
        while @in_game
            player_decision = gets.chomp.downcase
            case player_decision
            when 'h'
                player_draws
            when 's'
                puts "Dealer's turn."
                dealer_draws
                determine_dealers_action
            else
                puts "Invalid action! Please enter 'h' or 's'."
            end
            # if player_decision == 'h'
            #     player_draws
            # elsif player_decision == 's'
            #     puts "Dealer's turn."
            #     dealer_draws
            # else
            #     puts "Invalid action! Please enter 'h' or 's'."
            # end
        end
    end

    def player_draws
        hit(@player_cards)
        game_layout
        if @player_cards_sum > 21
            puts 'You bust! Bye bye money. Play again.'
            game_over
        elsif @player_cards_sum == 21
            puts 'Well done!'
            dealer_draws
        else
            ask_player
        end
    end

    def dealer_draws
        hit(@dealer_cards)
        game_layout
    end

    def determine_dealers_action
        while @dealer_cards_sum < 17
            puts 'Dealer will draw another card'
            dealer_draws
            if @dealer_cards_sum > 21
                puts "Dealer busts! You WIN. Winner winner chicken dinner!"
                game_over
                break
            elsif @dealer_cards_sum >= 17
                compare_score
                break
            end
        end
    end

    def player_cards_sum(array)
        sum = 0
        array.each do |card|
        sum += card
        end
        sum
    end

    def dealer_cards_sum(array)
        sum = 0
        array.each do |card|
        sum += card
        end
        sum
    end

    def game_over
        @in_game = false
    end

    def compare_score
        if @dealer_cards_sum > @player_cards_sum
            puts 'You lose!'
            game_over
        elsif @dealer_cards_sum == @player_cards_sum
            puts "It's a push."
            game_over
        else
            puts "You win!"
            game_over
        end
    end

    def hit(hand)
        hand.push(one_random_card)
    end

    def one_random_card
        @deck_of_cards.sample
    end

    def player_initial_cards
        [one_random_card, one_random_card]
    end

    def dealer_initial_card
        [one_random_card]
    end
end
Game.new