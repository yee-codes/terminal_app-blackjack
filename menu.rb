# Link Ruby Gems.
require "colorize"

puts '
                     #####     #   
#####        #      #     #   ##   
#    #       #            #  # #   
#####        #       #####     #   
#    #       #      #          #   
#    #  #    #      #          #   
#####    ####       #######  ##### 
                                   '.colorize(:color => :light_cyan)

# Display menu.
puts "1) Play\n2) Tutorial\n3) Quit"
puts ''
puts 'Enter 1 to play, 2 for tutorial and 3 to quit the game.'.colorize(:green)

loop do
    case gets.chomp.to_i
    when 1
        # Run blackjack file.
        require_relative 'run_game'
    when 2
        # Run tutorial file.
        require_relative 'tutorial'
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

# loop do
#     case gets.chomp.to_i
#     when 1
#         # run the blackjack file
#         require_relative 'run_game'
#     when 2
#         # run the tutorial file
#         require_relative 'tutorial'
#     when 3
#         # quit the app
#         exit
#     else
#         # handle unexpected input
#         puts "Please choose valid option"
#     end
# end

# # TEST CODE ABOVE

# # case select
# # when Play
# #     puts 'Run blackjack.rb'
# # when Tutorial
# #     puts 'Run tutorial.rb'
# # when Quit
# #     puts 'Have a great day!'
# # end