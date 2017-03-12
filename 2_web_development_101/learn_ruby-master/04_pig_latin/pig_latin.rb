#write your code here
def translate_word(word)
  # if vovel_checker(word) == 0
  #   return word + "ay"
  # elsif vovel_checker(word) == 1
  #   return word[1..-1] + word[0] + "ay"
  # elsif vovel_checker(word) == 2
  #   return word[2..-1] + word[0..1] + "ay"
  # elsif vovel_checker(word) == 3
  #   return word[3..-1] + word[0..2] + "ay"
  # end
  n = vovel_checker(word)
  w = word[n..-1] + word[0...n] + "ay"
  if w[0] == "u" and w[-3] == "q"
    return w[1..-3] + w[0] + w[-2..-1]
  end
  return w
end

def vovel_checker(word)
  v = ["a","e","i","o","u","y"]
  if word[0..1] == "qu"
    v.each do |i|
      if i == word[2]
        return 2
      end
    end
    v.each do |i|
      if i == word[3]
        return 3
      end
    end
  end
  v.each do |i|
    if i == word[0]
      return 0
    end
  end
  v.each do |i|
    if i == word[1]
      return 1
    end
  end
  v.each do |i|
    if i == word[2]
      return 2
    end
  end
  return 3
end

def translate(word)
  word = word.split(" ")
  tab = []
  word.each do |n|
    tab << translate_word(n)
  end
  tab = tab.join(" ")
  return tab
end
