class Board
  def initialize
    @board =
      [[0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]]
  end

  def display
    col_name = 97
    row_name = 1
    print "  ", row_name.to_s, " "
    row_name += 1
    print row_name.to_s, " "
    row_name += 1
    print row_name.to_s, " \n"
    for row in @board
      print(col_name.chr, ":")
      for column in row
        if column == 0
          print "  "
        elsif column == 1
          print "X "
        elsif column == 2
          print "O "
        end
      end
      col_name += 1
      print "\n"
    end
  end

  def move (col, row, player)
    case
    when col == "1"
      col = 0
    when col == "2"
      col = 1
    when col == "3"
      col = 2
    end
    case
      when row == "a"
        row = 0
      when row == "b"
        row = 1
      when row == "c"
        row = 2
      end
    if player == 1
      @board[row][col] = 1
    else
      @board[row][col] = 2
    end
  end

  def win_checker
    num = 2
    while num >= 0
      if @board[num][0] > 0 and @board[num][0] == @board[num][1] and @board[num][1] ==  @board[num][2]
        return TRUE
      elsif @board[0][num] > 0 and @board[0][num] == @board[1][num] and @board[1][num] ==  @board[2][num]
        return TRUE
      elsif @board[1][1] > 0 and @board[0][0] == @board[1][1] and @board[1][1] == @board[2][2]
        return TRUE
      elsif @board[1][1] > 0 and @board[2][0] == @board[1][1] and @board[1][1] == @board[0][2]
        return TRUE
      end
      num -= 1
    end
    return FALSE
  end
end

class Player
  attr_accessor :name, :symbol

  def initialize (name)
    @name = name
    @symbol = @@sym
    @@sym += 1
  end

  @@sym = 1
end

game = Board.new
print "Player 1 name: "
$player1 = Player.new(gets.chomp)
print "Player 2 name: "
$player2 = Player.new(gets.chomp)
var = 1




catch :won do
  while TRUE
    puts "= = = = = ="
    if var % 2 != 0
      current_player = $player1
    else
      current_player = $player2
    end

    puts "#{current_player.name} turn:"
    puts "= = = = = ="
    game.display
    begin
      print "Enter column: "
      col = gets.chomp
      print "Enter row: "
      row = gets.chomp
      game.move(col, row, current_player.symbol)
    rescue Exception
      puts "Error! Try again!"
      retry
    end
    if game.win_checker == TRUE
      puts "= = = = = = = = = = = = = = = = = = = = ="
      puts "GAME OVER! #{current_player.name} won!"
      throw :won
    end
    var += 1
  end
end
