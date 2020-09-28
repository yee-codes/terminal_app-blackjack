require "tty-prompt"
require "colorize"

prompt = TTY::Prompt.new
puts '
                     #####     #   
#####        #      #     #   ##   
#    #       #            #  # #   
#####        #       #####     #   
#    #       #      #          #   
#    #  #    #      #          #   
#####    ####       #######  ##### 
                                   '.colorize(:color => :light_cyan)
choices = %w(Play Tutorial Quit)
prompt.enum_select("Main Menu", choices)