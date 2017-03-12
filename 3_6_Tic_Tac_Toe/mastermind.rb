class Board

  attr_accessor :to_guess

  def initialize
    @to_guess = []
    4.times do
      @to_guess << rand(8)
    end
  end

  def checker (array_to_guess, guessing_array)
    same = array_to_guess & guessing_array
    almost_good = same.length()
    good = 0
    if almost_good == 0
      return ""
    else
      guessing_array.each_with_index do |number, id|
        if number == array_to_guess[id]
          almost_good -= 1
          good += 1
        end
      end
      if good == 4
        return TRUE
      end
      return "Good: #{good}\nAlmost good: #{almost_good}"
    end
  end
end

def guess_input
  contemporary = []
  4.times do
    print "Guess number (0-7):"
    contemporary << gets.chomp().to_i
  end
  return contemporary
end


while TRUE
  puts "NEW GAME"
  puts " + + + + + "
  game = Board.new()
  guessed = []
  n = 0
  catch :won do
    12.times do
      puts "ROUND #{n+1}!"
      guessed << guess_input()
      puts "guessed: #{guessed[n]}"
      val = game.checker(game.to_guess, guessed[n])
      if val == TRUE
        puts "YOU WON!"
        throw :won
      end
      puts val
      n = n + 1
    end
  end
end
