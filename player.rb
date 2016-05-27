class Player
  attr_accessor :life, :points, :name, :player_id
  @@players = []

  def initialize
    @life = 3
    @points = 0
    @player_id = @@players.length
    @@players << self
    get_name
  end


  private
    def get_name
      puts "what's your name?"
      loop do
        print "> "
        input = gets.chomp
        exit! if input == "quit"
        return @name = input unless input.empty?
      end
    end

    def self.players
      @@players
    end

    def self.find_player(name)
    end
end

