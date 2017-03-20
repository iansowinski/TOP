require 'json'

class Game
    attr_reader :guesses, :guessed, :word, :won
    def initialize(word, guesses=10)
        @word = word.split("")
        @guesses = guesses
        @won = false
        #@saved_game = File.open('savedgame')
    end

    def new_word (word)
        @word = word.split("")
        @won = false
    end

    def guess (letter)
        letter = letter.upcase if letter != nil
        if letter == "SAVE"
            puts "SAVED!"
            self.save
            return nil
        end
        @word.each_with_index do |word_letter, index|
            if word_letter == letter
                @guessed[index] = letter
            end
        end
        if @guessed.include?("_") != true
            puts "you won!"
            @guesses -= 1
            @won = true
            return nil 
        end
        @guesses -= 1
        puts "Guesses left: #{@guesses}"
        return nil
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
        @guesses = 20
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
                @words << line.chomp.upcase
            end
        end
    end
    def random_word
        return @words.sample
    end
end
