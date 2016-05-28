class Player
  attr_accessor :life, :points, :name
  attr_reader :player_id
  @@numplayers = 0

  def initialize
    @life = 3
    @points = 0
    set_player
    get_name
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

    def set_player
      @player_id = @@numplayers
      @@numplayers += 1
    end

    def self.numplayers
      @@numplayers
    end
end

