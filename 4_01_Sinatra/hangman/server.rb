require 'sinatra'
require 'sinatra/reloader'
load 'hangman.rb'

$dictionary = Dictionary.new('dictionary.txt')
$game = Game.new($dictionary.random_word, 20)
$game.new_words

get '/' do
  print "Guess a letter: "
  $game.guess(params['guess'])
  hangman = $game.guessed.join(" ")
  hangman = "you won!" if $game.won == true
  if $game.guesses == 0
    hangman = "you lost! #{$game.word.join()}" if $game.won == false
    erb :index, :locals => {:hangman => hangman, :guesses_left => $game.guesses}
    $game.new_word($dictionary.random_word)
    $game.save
    $game.new_words
  else
    erb :index, :locals => {:hangman => hangman, :guesses_left => $game.guesses}
  end
end
