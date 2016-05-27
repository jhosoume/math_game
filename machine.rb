class Player
  attr_accessor :life, :points, :name
  def initialize
    @life = 3
    @points = 0
    @name = ""
    get_name
  end

  private
    def get_name
      puts "What's your name?"
      loop do
        print "> "
        input = gets.chomp
        return @name = input unless input.empty?
      end
    end
end


class Game
  def initialize
    @turn = 0
    stage
  end

  private
    def get_input
      loop do
        print "> "
        input = gets.chomp
        return @name = input unless input.empty?
      end
    end

    def stage
      puts "How hard is the gaming going to be? [easy, medium, hard]"
      stg = get_input
      case stg
      when "easy"
        @difficult = 10
      when "medium"
        @difficult = 100
      when "hard"
        @difficult = 1000
      else
        "Sorry?"
        stage
      end

    end

    def end?
      @p1.life == 0 || @p2.life == 0
    end

    def get_sign
      sign = ['plus', 'minus', 'multiplication', 'division'].sample
    end

    def eval(num1, num2, sign)
      case sign
      when 'plus'
        num1 + num2
      when 'minus'
        num1 - num2
      when 'multiplication'
        num1 * num2
      when 'division'
        num1 / num2
      end
    end

    def turn
      num1 = rand(@difficult)
      num2 = rand(@difficult)
      sign = get_sing
      result = eval(num1, num2, sign)
    end

end