# Link Ruby Gems.
require 'colorize'
require 'artii'

# Class for the entire Blackjack game.
class Game
    # Run game.
    def initialize
        @in_game = true
        @play_msg = Artii::Base.new :font => 'standard'
        @bye = Artii::Base.new :font => 'starwars'
        # One deck of cards used for the app, Aces are counted as 11 points.
        @deck_of_cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
                          2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
                          2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
                          2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
        # Assign random cards to both player and dealer in the initial round.
        @player_cards = player_cards
        @dealer_cards = dealer_cards
        # Greet player.
        greet_player
        sleep(1)
        # Display current game status: player and dealer cards and total points.
        game_layout
        # Check player's hand for blackjack/21.
        check_for_blackjack
        # While loop and control flow to determine whose turn in game.
        gameplay
    end

    # Greet player.
    def greet_player
        puts @play_msg.asciify("Let's play!").colorize(:color => :light_yellow)
    end

    # Display current game status: player and dealer cards and total points.
    def game_layout
        @player_cards_sum = cards_total_value(@player_cards)
        @dealer_cards_sum = cards_total_value(@dealer_cards)
        # Add game effects (suspense) to the game.
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
        puts "Dealer's cards: #{@dealer_cards}, dealer's total: #{@dealer_cards_sum}.\n".colorize(:color => :light_red)
        sleep(1)
        puts "Player's cards: #{@player_cards}, player's total: #{@player_cards_sum}.\n".colorize(:color => :black, :background => :light_white)
    end

    # Check player's hand for blackjack/21.
    def check_for_blackjack
        if @player_cards_sum == 21
            puts "BOOM! BLACKJACK! YOU WIN! [̲̅$̲̅(̲̅ ͡° ͜ʖ ͡°̲̅)̲̅$̲̅]\n"
            puts 'Enter 1 to play again, 2 for tutorial or 3 to quit game.'.colorize(:green)
            game_loop
            # game_over
        elsif @player_cards_sum > 21
            puts "UNLUCKY! This is a rare occurence. You lose! ¯\_(ツ)_/¯"
        else ask_player
        end
    end

    # Puts question for player input: hit or stand.
    def ask_player
        puts "Would you like to 'Hit' (h) or 'Stand' (s)?".colorize(:color => :light_yellow)
        sleep(1)
    end

    # While loop and control flow to determine whose turn in game.
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

    # Control flow for when player decides to draw another card.
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
        when 22..31
            puts "You bust! Bye bye money. Play again. (⊙_☉)\n"
            puts 'Enter 1 to play again, 2 for tutorial and 3 to quit game.'.colorize(:green)
            game_loop
            # game_over
        when 21
            puts 'Well done!'
            dealer_draws
        else
            ask_player
        end
    end

    # Pre-defined drawing rules for the dealer.
    def dealer_draws
        hit(@dealer_cards)
        game_layout
        @dealer_sum = @dealer_cards.inject(0, :+)
        if @dealer_sum < 17
            puts 'Dealer will draw another card'
            sleep(1)
            dealer_draws
        elsif @dealer_sum > 21
            puts "Dealer busts! You WIN. Winner winner chicken dinner! ლ( ̅°̅ ੪ ̅°̅ )ლ\n"
            puts 'Enter 1 to play again, 2 for tutorial and 3 to quit game.'.colorize(:green)
            game_loop
            # game_over
        elsif @dealer_sum > 16 && @dealer_sum <= 21
            compare_score
        end
    end

    # Sum up player's cards total points.
    def player_cards_sum(array)
        sum = 0
        array.each do |card|
        sum += card
        end
        sum
    end

    # Sum up dealer's cards total points.
    def dealer_cards_sum(array)
        sum = 0
        array.each do |card|
        sum += card
        end
        sum
    end

    # Sum up a hand's total points.
    def cards_total_value(cards)
        sum = 0
        cards.each do |card|
        sum += card
        end
        sum
    end

    # Change state of game from true to false: end of a game.
    def game_over
        @in_game = false
    end

    # Determine game outcome: player wins, dealer wins or push/tie.
    def compare_score
        if @dealer_cards_sum > @player_cards_sum
            puts "You lose! ¯\_(ツ)_/¯\n"
            puts 'Enter 1 to play again, 2 for tutorial and 3 to quit game.'.colorize(:green)
            game_loop
            # game_over
        elsif @dealer_cards_sum == @player_cards_sum
            puts "It's a push. ᕙ(⇀‸↼‶)ᕗ\n"
            puts 'Enter 1 to play again, 2 for tutorial and 3 to quit game.'.colorize(:green)
            game_loop
            # game_over
        else
            puts "You win! (>‿◠)\n"
            puts 'Enter 1 to play again, 2 for tutorial and 3 to quit game.'.colorize(:green)
            game_loop
            # game_over
        end
    end

    # Add one random card to a hand.
    def hit(hand)
        hand.push(one_random_card)
    end

    # Draw one random card from the deck.
    def one_random_card
        @deck_of_cards.sample
    end

    # Draw player initial two cards.
    def player_cards
        [one_random_card, one_random_card]
    end

    # Draw dealer initial one card.
    def dealer_cards
        [one_random_card]
    end

    def game_loop
        loop do
            case gets.chomp.to_i
            when 1
                # Run blackjack file.
                require_relative 'run_game'
            when 2
                require_relative 'tutorial'
            when 3
                # Quit app
                puts @bye.asciify("Bye!").colorize(:color => :light_cyan)
                sleep(2)
                system 'cls'
                exit
            else
                # Unexpected input.
                puts 'Invalid input! Please enter 1, 2 or 3.'
            end
        end
    end
end
# Game.new