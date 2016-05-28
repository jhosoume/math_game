require 'colorize'

class Game
  def initialize
    starting_message
    @turn_num = 0
    @players = []
    stage
    create_players
    while !over? do 
      turn
    end 
    end_message
  end

  private
    def create_players
      get_nplayers.times { @players << Player.new }
    end

    def get_nplayers
      puts "How many players are going to join?"
      nplayers = get_input.to_i
      if nplayers <= 0  
        puts 'Ohh no! We do not have enough players! :('
        get_nplayers
      else
        nplayers
      end
    end

    def starting_message
      puts "Game started!"
      puts 'Type "quit" anytime to exit the game.'
      puts "Take note: divisions here don't consider the remainder."
    end

    def get_input
      loop do
        print "> "
        input = gets.chomp
        exit! if input == "quit"
        return @name = input unless input.empty?
      end
    end

    def stage
      print "How hard is the gaming going to be? ", "[", "easy".blue, ", ", "medium".yellow, ", ", "hard".red, "]\n"
      stg = get_input
      case stg
      when "easy"
        @difficult = 20
      when "medium"
        @difficult = 100
      when "hard"
        @difficult = 1000
      when "quit"
        exit!
      else
        puts "Sorry?"
        stage
      end
    end

    def over?
      @players.any? { |player| player.life <= 0 }
    end

    def end_message
      puts "\n\t\tGAME OVER\n".red
      puts "PLAYERS SCORES:"
      @players.each { |player| puts "#{player.name}: #{player.points} points" }
    end

    def get_sign
      ['plus', 'minus', 'multiplied', 'divided'].sample
    end

    def eval(num1, num2, sign)
      case sign
      when 'plus'
        num1 + num2
      when 'minus'
        num1 - num2
      when 'multiplied'
        num1 * num2
      when 'divided'
        num1 / num2
      end
    end

    def get_answer
      answ = get_input
      answ.to_i
    end

    def which_player
      # Improve to accept more players
      @players[@turn_num % @players.count]
    end

    def turn
      player = which_player
      num1 = rand(@difficult)
      num2 = rand(@difficult)
      sign = get_sign
      result = eval(num1, num2, sign)
      puts "#{player.name}: What does #{num1} #{sign} #{num2} equal?".blue
      answ = get_answer 
      if result == answ
        puts "That's correct!".green
        player.points += 1
        puts "One more point! You, #{player.name}, now have #{player.points} points"
      else
        puts "Oh no! That's incorrect!".yellow
        player.life -= 1
        puts "You know have #{player.life} life(s)"
      end
      @turn_num += 1
    end
end
