require 'sinatra'
require 'sinatra/reloader' 

get '/' do
  guess = params['guess']
  error = guess_checker(guess)
  erb :index, :locals => {:number => Number, :error => error}
end
Number = rand(100)
def guess_checker (item, number=Number)
  if item != nil
    return "Too high!" if item.to_i > number
    return "Too low!" if item.to_i < number
    return "Correct, anwser is #{number}!" if item.to_i == number
  end
end
