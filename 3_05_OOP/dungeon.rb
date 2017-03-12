# komentarz 1
class Dungeon
  attr_accessor :player
  #komentarz 1.1
  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end
  # komentarz 1.2
  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end
  # komentarz 1.3
  def start (location)
      @player.location = location
      show_current_description
  end
  # komentarz 1.4
  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end
  # komentarz 1.5
  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference }
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go (direction)
    puts "You go "+ direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end
  # komentarz 2
  class Player
    attr_accessor :name, :location
    # komentarz 2.2
    def initialize (name)
      @name = name
    end
  end

  class Room
    attr_accessor :reference, :name, :description, :connections

    def initialize (reference, name, description, connections)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
    end
    # komentarz 3
    def full_description
      @name + "\n\nYou are in " + @description
    end
  end
end

my_dungeon = Dungeon.new("Janko")

my_dungeon.add_room(:duzajaskinia, "Duża Jaskinia", "Duża i straszna jaskinia", {:west => :malajaskinia})

my_dungeon.add_room(:malajaskinia, "Mała Jaskinia", "Mała i dziwna jaskinia", {:east => :duzajaskinia})

my_dungeon.start(:duzajaskinia)

while TRUE
  case command = gets.chomp
    when "go"
      puts "where?"
      my_dungeon.go(gets.chomp.to_sym)
    when "help"
      puts "enter 'go' to go somewhere :)"
    else
      puts "error, try another command"
  end
end

my_dungeon.go(:west)
