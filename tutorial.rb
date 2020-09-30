require 'colorize'

puts ''
puts 'The object of the game of Blackjack is simply to get more points than the dealer without going over 21.'.colorize(:light_blue)
puts ''
puts "Rules:".colorize(:light_blue)
puts ''
puts "1. Aces are counted as 11 points, 2 to 9 according to pip value, and tens and face cards count as ten points.".colorize(:light_blue)
puts ''
puts "2. The value of a hand is the sum of the point values of the individual cards.".colorize(:light_blue)
puts ''
puts "3. In the initial round, the player gets dealt two cards and the dealer gets dealt one card.".colorize(:light_blue)
puts ''
puts "4. The player has blackjack if the total of his/her initial hand is 21, the player wins immediately.".colorize(:light_blue)
puts ''
puts "5. Otherwise, the player can choose one of two options to proceed: hit or stand. Hit: player draws another card (and more if he/she wishes). If this card causes the player's total points to exceed 21 (known as busting) then he loses. Stand: player stands with his cards.".colorize(:light_blue)
puts ''
puts "6. After the player has had his/her turn, the dealer will draw another card. The dealer will continue to draw until the dealer has a total of 17 or more.".colorize(:light_blue)
puts ''
puts "7. If the dealer goes over 21, player wins.".colorize(:light_blue)
puts ''
puts "8. If the dealer does not bust, then the higher point total between the player and the dealer will win.".colorize(:light_blue)
puts ''
puts 'Enter 1 to play, 3 to quit or 2 to go to the menu.'.colorize(:green)
puts ''

loop do
    case gets.chomp.to_i
    when 1
        # Run blackjack file.
        require_relative 'run_game'
    when 2
        require_relative 'menu'
    when 3
        # Quit app
        puts '
        _______  __   __  _______  __  
        |  _    ||  | |  ||       ||  | 
        | |_|   ||  |_|  ||    ___||  | 
        |       ||       ||   |___ |  | 
        |  _   | |_     _||    ___||__| 
        | |_|   |  |   |  |   |___  __  
        |_______|  |___|  |_______||__| '.colorize(:color => :light_red)
        sleep(2)
        system 'cls'
        exit
    else
        # Unexpected input.
        puts 'Invalid input! Please enter 1, 2 or 3.'
    end
end