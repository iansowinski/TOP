load 'tic.rb'

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
