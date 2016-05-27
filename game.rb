class Game
  def initialize
    starting_message
    @turn_num = 0
    stage
    @p1 = Player.new
    @p2 = Player.new
    while !end?
      turn
    end
  end

  private
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
      puts "How hard is the gaming going to be? [easy, medium, hard]"
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
        "Sorry?"
        stage
      end
    end

    def end?
      @p1.life == 0 || @p2.life == 0
    end

    def get_sign
      sign = ['plus', 'minus', 'multiplied', 'divided'].sample
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
      case @turn_num % 2
      when 0 
        return @p1
      when 1
        return @p2
      end
    end

    def turn
      player = which_player
      num1 = rand(@difficult)
      num2 = rand(@difficult)
      sign = get_sign
      result = eval(num1, num2, sign)
      puts "#{player.name}: What does #{num1} #{sign} #{num2} equal?"
      answ = get_answer 
      if result == answ
        puts "That's correct!"
        player.points += 1
        puts "One more point! You, #{player.name}, now have #{player.points} points"
      else
        puts "Oh no! That's incorrect!"
        player.life -= 1
        puts "You know have #{player.life} life(s)"
      end
      @turn_num += 1
    end
end
