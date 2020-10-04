# Link Ruby Gems.
require "colorize"
require "artii"
require "terminal-table"

system 'cls'

# Group menu items in a table using terminal-table.
menu = []
menu << ["1) Play"]
menu << ["2) How to Play"]
menu << ["3) Quit"]
table = Terminal::Table.new :rows => menu

# Use Ruby Gem Artii for ASCII art.
bj_21 = Artii::Base.new :font => 'starwars'
bye = Artii::Base.new :font => 'starwars'
puts bj_21.asciify('BJ 21').colorize(:color => :light_cyan)

# Display menu.
puts table
puts 'Enter 1 to play, 2 for tutorial and 3 to quit the game.'.colorize(:green)

# User input stored to a variable.
choice = gets.chomp.to_i

# Loop to evaluate user input and error handling.
loop do
    case choice
    when 1
        # Run blackjack game file.
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