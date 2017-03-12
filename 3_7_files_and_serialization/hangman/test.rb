require "rubygems"
require "Akcja"

puts Akcja::Zmienna
puts Akcja::Niemienna
puts Akcja::Reakcja.new(123, 456).sum
puts Akcja::Nie.new()