class Game
  attr_reader :board
  def initialize (player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @board = Board.new
  end
  def players
    return [@player_1, @player_2]
  end
end
class Board

  attr_reader :board_array

  def initialize
    @board_array = []
    6.times do |n|
      @board_array << []
      7.times do
        @board_array[n] << nil
      end
    end
  end

  def print_table
    @board_array.each_with_index do |n, ni|
      n.each_with_index do |item, index|
        if item == nil
          print index != 6 ? "| " : "| |"
        else
          print index != 6 ? "|#{item[ni]}" : "|#{item[ni]}|"
        end
      end
      print "\n"
    end
  end
  def last_free (col)
    @board_array[col].each_with_index do |item, index|
      return index if item == nil
    end
  end
  def set (col, player)
    if col > 6
      raise ArgumentError, "column do not exist"
    elsif player != 1 and 2
      raise ArgumentError, "player do not exist"
    else 
      @board_array[col][last_free(col)] = player
    end
  end
end
