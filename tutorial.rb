require 'colorize'
require 'artii'
require 'tty-prompt'

# Explain what blackjack is and game rules.
puts 'How to Play'.colorize(:green)
puts "The object of the game of Blackjack is simply to get more points than the dealer without going over 21.\n".colorize(:light_blue)
puts 'Game Rules'.colorize(:green)
puts "1. Aces are counted as 11 points, 2 to 9 according to pip value, and tens and face cards count as ten points.\n".colorize(:light_blue)
puts "2. The value of a hand is the sum of the point values of the individual cards.\n".colorize(:light_blue)
puts "3. In the initial round, the player gets dealt two cards and the dealer gets dealt one card.\n".colorize(:light_blue)
puts "4. The player has blackjack if the total of his/her initial hand is 21, the player wins immediately.\n".colorize(:light_blue)
puts "5. Otherwise, the player can choose one of two options to proceed: hit or stand. Hit: player draws another card (and more if he/she wishes). If this card causes the player's total points to exceed 21 (known as busting) then he loses. Stand: player stands with his cards.\n".colorize(:light_blue)
puts "6. After the player has had his/her turn, the dealer will draw another card. The dealer will continue to draw until the dealer has a total of 17 or more.\n".colorize(:light_blue)
puts "7. If the dealer goes over 21, player wins.\n".colorize(:light_blue)
puts "8. If the dealer does not bust, then the higher point total between the player and the dealer will win.\n".colorize(:light_blue)
# puts "Enter 1 to play, 3 to quit or 2 to go to the menu.\n".colorize(:green)

# # ASCII Art
# bye = Artii::Base.new :font => 'starwars'

# loop do
#     case gets.chomp.to_i
#     when 1
#         # Run blackjack file.
#         require_relative 'run_game'
#     when 2
#         require_relative 'menu'
#     when 3
#         # Quit app
#         puts bye.asciify("Bye!").colorize(:color => :light_cyan)
#         sleep(2)
#         system 'cls'
#         exit
#     else
#         # Unexpected input.
#         puts 'Invalid input! Please enter 1, 2 or 3.'
#     end
# end

prompt = TTY::Prompt.new
replay = 'Wanna play again?'
choices = %w(Play Home Quit)
answer = prompt.select(replay, choices)

if answer == choices[0]
    require_relative 'run_game'
elsif answer == choices[1]
    require_relative 'menu'
elsif answer == choices[2]
    quit
end

def quit
    puts @bye.asciify("Bye!").colorize(:color => :light_cyan)
    sleep(2)
    system 'cls'
    exit
end