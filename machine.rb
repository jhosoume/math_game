require_relative 'player'
require_relative 'game'

class Machine
  def initialize
    init_message

  end

  private
    def init_message
      puts "Welcome to Math Game!"
      puts "Press ENTER to start.\n"
      gets
    end

    def get_input
      loop do
        print "> "
        input = gets.chomp
        exit! if input == "quit"
        return @name = input unless input.empty?
      end
    end

    def restart?
      puts "Want to restart? [Y/N]"
      case get_input
      when "Y"
        true
      when "N"
        false
      else
        restart?
      end
    end
end