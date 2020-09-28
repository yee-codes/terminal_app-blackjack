# class Game
#     def initialize
#         @in_game = true
#         @deck_of_cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
#                           2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
#                           2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
#                           2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
#         @player_cards = player_cards
#         @dealer_cards = dealer_cards
#         greet_player
#         game_layout
#         check_for_blackjack
#         # ask_player
#         gameplay
#     end

#     def greet_player
#         puts '
#                                                                              ######                                                          
#         #  #  # ###### #       ####   ####  #    # ######    #####  ####     #     # #        ##    ####  #    #      #   ##    ####  #    # 
#         #  #  # #      #      #    # #    # ##  ## #           #   #    #    #     # #       #  #  #    # #   #       #  #  #  #    # #   #  
#         #  #  # #####  #      #      #    # # ## # #####       #   #    #    ######  #      #    # #      ####        # #    # #      ####   
#         #  #  # #      #      #      #    # #    # #           #   #    #    #     # #      ###### #      #  #        # ###### #      #  #   
#         #  #  # #      #      #    # #    # #    # #           #   #    #    #     # #      #    # #    # #   #  #    # #    # #    # #   #  
#          ## ##  ###### ######  ####   ####  #    # ######      #    ####     ######  ###### #    #  ####  #    #  ####  #    #  ####  #    #'
#         puts '
#         #####                           #                            
#         #     #  ####   ####  #####     #       #    #  ####  #    # 
#         #       #    # #    # #    #    #       #    # #    # #   #  
#         #  #### #    # #    # #    #    #       #    # #      ####   
#         #     # #    # #    # #    #    #       #    # #      #  #   
#         #     # #    # #    # #    #    #       #    # #    # #   #  
#          #####   ####   ####  #####     #######  ####   ####  #    #'
#     end

#     def game_layout
#         @player_cards_sum = cards_total_value(@player_cards)
#         @dealer_cards_sum = cards_total_value(@dealer_cards)
#         puts "Dealer's cards: #{@dealer_cards}, dealer's total: #{@dealer_cards_sum}."
#         puts "Player's cards: #{@player_cards}, player's total: #{@player_cards_sum}."     
#     end

#     def check_for_blackjack
#         if @player_cards_sum == 21
#             puts 'BOOM! BLACKJACK! YOU WIN!' 
#             game_over
#         else ask_player
#         end
#     end

#     def ask_player
#         puts "Would you like to 'Hit' (h) or 'Stand' (s)?"
#     end

#     def gameplay
#         while @in_game
#             player_decision = gets.chomp.downcase
#             case player_decision
#             when 'h'
#                 player_draws
#             when 's'
#                 puts "Dealer's turn."
#                 dealer_draws
#                 determine_dealers_action
#             else
#                 puts "Invalid action! Please enter 'h' or 's'."
#             end
#             # if player_decision == 'h'
#             #     player_draws
#             # elsif player_decision == 's'
#             #     puts "Dealer's turn."
#             #     dealer_draws
#             # else
#             #     puts "Invalid action! Please enter 'h' or 's'."
#             # end
#         end
#     end

#     # def player_draws
#     #     hit(@player_cards)
#     #     game_layout
#     #     if @player_cards_sum > 21
#     #         puts 'You bust! Bye bye money. Play again.'
#     #         game_over
#     #     elsif @player_cards_sum == 21
#     #         puts 'Well done!'
#     #         dealer_draws
#     #     else
#     #         ask_player
#     #     end
#     # end

#     def player_draws
#         hit(@player_cards)
#         game_layout
#         case@player_cards_sum
#         when 22..100
#             puts 'You bust! Bye bye money. Play again.'
#             game_over
#         when 21
#             puts 'Well done!'
#             dealer_draws
#         else
#             ask_player
#         end
#     end

#     def dealer_draws
#         hit(@dealer_cards)
#         game_layout
#         @dealer_sum = @dealer_cards.inject(0, :+)
#         @dealer_sum
#     end

#     # def determine_dealers_action
#     #     while @dealer_cards_sum < 17
#     #         puts 'Dealer will draw another card'
#     #         dealer_draws
#     #         if @dealer_cards_sum > 21
#     #             puts "Dealer busts! You WIN. Winner winner chicken dinner!"
#     #             game_over
#     #             break
#     #         elsif @dealer_cards_sum > 16 && @dealer_cards_sum <=21
#     #             compare_score
#     #             break
#     #         end
#     #     end
#     # end

#     def determine_dealers_action
#         while @dealer_sum < 17
#             puts 'Dealer will draw another card'
#             dealer_draws
#             compare_score
#             if @dealer_cards_sum > 21
#                 puts "Dealer busts! You WIN. Winner winner chicken dinner!"
#                 game_over
#             elsif 
#                 @dealer_cards_sum > 16 && @dealer_cards_sum <=21
#                 compare_score
#             end
#         end
#     end
    
#     def player_cards_sum(array)
#         sum = 0
#         array.each do |card|
#         sum += card
#         end
#         sum
#     end

#     def dealer_cards_sum(array)
#         sum = 0
#         array.each do |card|
#         sum += card
#         end
#         sum
#     end

#     def cards_total_value(cards)
#         sum = 0
#         cards.each do |card|
#         sum += card
#         end
#         sum
#     end

#     def game_over
#         @in_game = false
#     end

#     def compare_score
#         if @dealer_cards_sum > @player_cards_sum
#             puts 'You lose!'
#             game_over
#         elsif @dealer_cards_sum == @player_cards_sum
#             puts "It's a push."
#             game_over
#         else
#             puts "You win!"
#             game_over
#         end
#     end

#     def hit(hand)
#         hand.push(one_random_card)
#     end

#     def one_random_card
#         @deck_of_cards.sample
#     end

#     def player_cards
#         [one_random_card, one_random_card]
#     end

#     def dealer_cards
#         [one_random_card]
#     end
# end
# Game.new

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
        #  #  # ###### #       ####   ####  #    # ######    #####  ####     #     # #        ##    ####  #    #      #   ##    ####  #    # 
        #  #  # #      #      #    # #    # ##  ## #           #   #    #    #     # #       #  #  #    # #   #       #  #  #  #    # #   #  
        #  #  # #####  #      #      #    # # ## # #####       #   #    #    ######  #      #    # #      ####        # #    # #      ####   
        #  #  # #      #      #      #    # #    # #           #   #    #    #     # #      ###### #      #  #        # ###### #      #  #   
        #  #  # #      #      #    # #    # #    # #           #   #    #    #     # #      #    # #    # #   #  #    # #    # #    # #   #  
         ## ##  ###### ######  ####   ####  #    # ######      #    ####     ######  ###### #    #  ####  #    #  ####  #    #  ####  #    #'
        puts '
        #####                           #                            
        #     #  ####   ####  #####     #       #    #  ####  #    # 
        #       #    # #    # #    #    #       #    # #    # #   #  
        #  #### #    # #    # #    #    #       #    # #      ####   
        #     # #    # #    # #    #    #       #    # #      #  #   
        #     # #    # #    # #    #    #       #    # #    # #   #  
         #####   ####   ####  #####     #######  ####   ####  #    #'
    end

    def game_layout
        @player_cards_sum = cards_total_value(@player_cards)
        @dealer_cards_sum = cards_total_value(@dealer_cards)
        sleep(2)
        system 'cls' 
        puts 'Cards in the air.'
        sleep(1)
        system 'cls' 
        puts 'Cards in the air..'
        sleep(1)
        system 'cls' 
        puts 'Cards in the air...'
        sleep(1)
        system 'cls'
        puts "Dealer's cards: #{@dealer_cards}, dealer's total: #{@dealer_cards_sum}."
        sleep(2)
        puts "Player's cards: #{@player_cards}, player's total: #{@player_cards_sum}."     
    end

    def check_for_blackjack
        if @player_cards_sum == 21
            puts 'BOOM! BLACKJACK! YOU WIN!' 
            game_over
        else ask_player
        end
    end

    def ask_player
        puts "Would you like to 'Hit' (h) or 'Stand' (s)?"
        sleep(2)
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
                # determine_dealers_action
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

    # def player_draws
    #     hit(@player_cards)
    #     game_layout
    #     if @player_cards_sum > 21
    #         puts 'You bust! Bye bye money. Play again.'
    #         game_over
    #     elsif @player_cards_sum == 21
    #         puts 'Well done!'
    #         dealer_draws
    #     else
    #         ask_player
    #     end
    # end

    def player_draws
        sleep(2)
        puts 'Getting your card.'
        system 'cls'
        puts 'Getting your card..'
        system 'cls'
        puts 'Getting your card...'
        system 'cls'
        hit(@player_cards)
        game_layout
        case @player_cards_sum
        when 22..100
            puts 'You bust! Bye bye money. Play again.'
            game_over
        when 21
            puts 'Well done!'
            dealer_draws
        else
            ask_player
        end
    end

    # def dealer_draws
    #     hit(@dealer_cards)
    #     game_layout
    #     @dealer_sum = @dealer_cards.inject(0, :+)
    #     @dealer_sum
    # end

    def dealer_draws
        sleep(2)
        hit(@dealer_cards)
        game_layout
        @dealer_sum = @dealer_cards.inject(0, :+)
        if @dealer_sum < 17
            puts 'Dealer will draw another card'
            dealer_draws
        elsif @dealer_sum > 21
            puts "Dealer busts! You WIN. Winner winner chicken dinner!"
            game_over
        elsif @dealer_sum > 16 && @dealer_sum <= 21
            compare_score
        end
    end

    # def determine_dealers_action
    #     while @dealer_cards_sum < 17
    #         puts 'Dealer will draw another card'
    #         dealer_draws
    #         if @dealer_cards_sum > 21
    #             puts "Dealer busts! You WIN. Winner winner chicken dinner!"
    #             game_over
    #             break
    #         elsif @dealer_cards_sum > 16 && @dealer_cards_sum <=21
    #             compare_score
    #             break
    #         end
    #     end
    # end

    # def determine_dealers_action
    #     while @dealer_sum < 17
    #         puts 'Dealer will draw another card'
    #         dealer_draws
    #         compare_score
    #         if @dealer_cards_sum > 21
    #             puts "Dealer busts! You WIN. Winner winner chicken dinner!"
    #             game_over
    #         elsif 
    #             @dealer_cards_sum > 16 && @dealer_cards_sum <=21
    #             compare_score
    #         end
    #     end
    # end
    
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

    def player_cards
        [one_random_card, one_random_card]
    end

    def dealer_cards
        [one_random_card]
    end
end
Game.new