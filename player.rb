class Player
  attr_accessor :life, :points, :name, :player_id
  @@playnum = 1
  def initialize
    @life = 3
    @points = 0
    @name = ""
    get_name
    player_number
  end

  private
    def get_name
      puts "What's your name?"
      loop do
        print "> "
        input = gets.chomp
        exit! if input == "quit"
        return @name = input unless input.empty?
      end
    end

    def player_number
      @player_id = @@playnum
      @@playnum += 1
    end
end
