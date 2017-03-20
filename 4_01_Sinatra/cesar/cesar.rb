require 'sinatra'i
require 'sinatra/reloader'

get '/' do
  key = params['key']
  value = params['value']
  text = cesar_cipher(value, key.to_i)
  erb :index, :locals => {:text => text}
end


def num_check(n)
  if n < 27 and n > -1
    return n
  elsif n > 26
    num_check(n - 26)
  elsif n < 0
    num_check(n + 26)
  end
end
def cesar_cipher (user_data, num)
  num = num_check(num)
  return nil if user_data == nil
  text_array = user_data.split("")
  new_array = []
  text_array.each do |letter|
    asc = letter.ord
    if asc.between?(97, 122)
      asc = asc + num
      if asc > 122
        asc = 96 + (asc - 122)
      elsif asc < 97
        asc = 123 - (97 - asc)
      end
    end
    if asc.between?(64, 90)
      asc = asc + num
      if asc > 90
        asc = 63 + (asc - 90)
      elsif asc < 64
        asc = 91 - (64 - asc)
      end
    end
    new_array << asc.chr
  end
  return new_array.join("")
end
