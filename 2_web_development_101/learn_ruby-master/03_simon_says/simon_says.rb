#write your code here
def echo(word)
  return word
end

def shout(word)
  return word.upcase
end

def repeat(word, n = nil)
  if n == nil or n == 1
    return word + " " + word
  else
    return word + (" " + word) * (n-1)
  end
end

def start_of_word (start, n)
  return start[0...n]
end

def first_word(word)
  word = word.split(" ")
  return word[0]
end

def titleize(word)
  sent = word.split(" ")
  sent.each do |i|
    if i != "and" and i != "over" and i != "the"
      i[0] = i[0].upcase
    elsif i == sent[0]
      i[0] = i[0].upcase
    end
  end
  sent = sent.join(" ")
  return sent
end
