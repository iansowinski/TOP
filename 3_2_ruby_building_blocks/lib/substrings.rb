def substrings phrase, dictionary
  result = {}
  phrase = (phrase.downcase).split(" ")
  counter = 0
  dictionary.each do |dictionary_word|
    phrase.each do |phrase_word|
      counter += 1 if (phrase_word.include?(dictionary_word))
    end
    result[dictionary_word] = counter if counter > 0
    counter = 0
  end
  return result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
