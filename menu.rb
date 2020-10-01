# Link Ruby Gems.
require "colorize"
require "artii"

# Use Ruby Gem Artii for ASCII art.
bj_21 = Artii::Base.new :font => 'starwars'
bye = Artii::Base.new :font => 'starwars'
puts bj_21.asciify('BJ 21').colorize(:color => :light_cyan)

# Display menu.
puts "1) Play".colorize(:color => :light_magenta)
puts "2) How to Play".colorize(:color => :light_yellow)
puts "3) Quit".colorize(:color => :light_blue)
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
        puts bye.asciify("Bye!").colorize(:color => :light_cyan)
        sleep(2)
        system 'cls'
        exit
    else
        # Unexpected input.
        puts 'Invalid input! Please enter 1, 2 or 3.'
    end
end