require 'json'

class Game

    def initialize(word, guesses=10)
        @word = word.split("")
        @guesses = guesses
        #@saved_game = File.open('savedgame')
    end

    def new_word (word)
        @word = word.split("")
    end

    def play
        while @guesses > 0
            puts @guessed.join(" ")
            #puts @word.join(" ")
            print "Guess a letter: "
            letter = gets.chomp.downcase
            if letter == "save"
                puts "SAVED!"
                self.save
                next
            end
            @word.each_with_index do |word_letter, index|
                if word_letter == letter
                    @guessed[index] = letter
                end
            end
            if @guessed.include?("_") != true
                puts "you won!"
                return true 
            end
            @guesses -= 1
            puts "Guesses left: #{@guesses}"
        end
        puts "you lose! The word was: '#{@word.join('')}'"
    end
    def load
        file = JSON.load(File.read('savedgame'))
        @guessed = file[0]
        @word = file[1]
    end
    def save
        file = File.open('savedgame', 'w+')
        file.write(JSON.dump(([@guessed, @word])))
        file.close
    end
    def new_words
        @guesses = 10
        @guessed = []
        @word.length().times do 
            @guessed << "_"
        end
    end
end

class Dictionary
    attr_accessor :dictionary_array
    def initialize(file_name, min_letters=5, max_letters=12)
        @words = []
        File.readlines(file_name).each do |line|
            if line.chomp.length >= min_letters and line.chomp.length <= max_letters
                @words << line.chomp.downcase
            end
        end
    end
    def random_word
        return @words.sample
    end
end

dictionary = Dictionary.new('dictionary.txt')
game = Game.new(dictionary.random_word, 20)
print "Load? (Y/N)? "
if gets.chomp.downcase == "y"
    game.load 
else
    game.new_words
end
while true
    game.play
    game.new_word(dictionary.random_word)
    game.save
    game.new_words
end
