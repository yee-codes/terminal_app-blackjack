require 'colorize'
require 'colorized_string'

class Game
    def initialize
        @in_game = true
        @deck_of_cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
                          2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
                          2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
                          2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
        @player_cards = player_cards
        @dealer_cards = dealer_cards
        greet_player
        game_layout
        check_for_blackjack
        gameplay
    end

    def greet_player
        puts '
        ######                                                          
        #     # #        ##    ####  #    #      #   ##    ####  #    # 
        #     # #       #  #  #    # #   #       #  #  #  #    # #   #  
        ######  #      #    # #      ####        # #    # #      ####   
        #     # #      ###### #      #  #        # ###### #      #  #   
        #     # #      #    # #    # #   #  #    # #    # #    # #   #  
        ######  ###### #    #  ####  #    #  ####  #    #  ####  #    # '.colorize(:color => :light_yellow)
    end

    def game_layout
        @player_cards_sum = cards_total_value(@player_cards)
        @dealer_cards_sum = cards_total_value(@dealer_cards)
        sleep(1)
        system 'cls' 
        puts 'Cards in the air.'.colorize(:color => :light_blue)
        sleep(1)
        system 'cls' 
        puts 'Cards in the air..'.colorize(:color => :red)
        sleep(1)
        system 'cls' 
        puts 'Cards in the air...'.colorize(:color => :light_yellow)
        sleep(1)
        system 'cls'
        puts "Dealer's cards: #{@dealer_cards}, dealer's total: #{@dealer_cards_sum}.".colorize(:color => :light_red)
        puts ''
        sleep(1)
        puts "Player's cards: #{@player_cards}, player's total: #{@player_cards_sum}.".colorize(:color => :black, :background => :light_white)
        puts ''     
    end

    def check_for_blackjack
        if @player_cards_sum == 21
            puts 'BOOM! BLACKJACK! YOU WIN! [̲̅$̲̅(̲̅ ͡° ͜ʖ ͡°̲̅)̲̅$̲̅]' 
            game_over
        else ask_player
        end
    end

    def ask_player
        puts "Would you like to 'Hit' (h) or 'Stand' (s)?".colorize(:color => :light_yellow)
        sleep(1)
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
            else
                puts "Invalid action! Please enter 'h' or 's'."
            end
        end
    end

    def player_draws
        system 'cls' 
        puts 'Getting your card.'.colorize(:color => :blue)
        sleep(1)
        system 'cls'
        puts 'Getting your card..'.colorize(:color => :magenta)
        sleep(1)
        system 'cls'
        puts 'Getting your card...'.colorize(:color => :green)
        sleep(1)
        system 'cls'
        hit(@player_cards)
        game_layout
        case @player_cards_sum
        when 22..100
            puts 'You bust! Bye bye money. Play again. (⊙_☉)'
            game_over
        when 21
            puts 'Well done!'
            dealer_draws
        else
            ask_player
        end
    end

    def dealer_draws
        hit(@dealer_cards)
        game_layout
        @dealer_sum = @dealer_cards.inject(0, :+)
        if @dealer_sum < 17
            puts 'Dealer will draw another card'
            dealer_draws
        elsif @dealer_sum > 21
            puts "Dealer busts! You WIN. Winner winner chicken dinner! ლ( ̅°̅ ੪ ̅°̅ )ლ "
            game_over
        elsif @dealer_sum > 16 && @dealer_sum <= 21
            compare_score
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

    def cards_total_value(cards)
        sum = 0
        cards.each do |card|
        sum += card
        end
        sum
    end

    def game_over
        @in_game = false
    end

    def compare_score
        if @dealer_cards_sum > @player_cards_sum
            puts 'You lose! ¯\_(ツ)_/¯'
            game_over
        elsif @dealer_cards_sum == @player_cards_sum
            puts "It's a push. ᕙ(⇀‸↼‶)ᕗ"
            game_over
        else
            puts "You win! (>‿◠)"
            game_over
        end
    end

    def hit(hand)
        hand.push(one_random_card)
    end

    def one_random_card
        @deck_of_cards.sample
    end

    def player_cards
        [one_random_card, one_random_card]
    end

    def dealer_cards
        [one_random_card]
    end
end
Game.new