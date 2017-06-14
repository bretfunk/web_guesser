require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
number = SECRET_NUMBER

get '/' do
  guess = params['guess']
  message, color = check_guess(guess, number) unless nil
  erb :index, locals: { number: number, message: message, color: color }
end

def check_guess(guess, number)
  if guess.nil?
  elsif guess.to_i == number
    ["You got it right!  The SECRET NUMBER is #{guess}", 'green']
  elsif guess.to_i > number + 5
    ['Way too high!', 'red']
  elsif guess.to_i > number
    ['Too high!', 'pink']
  elsif guess.to_i < number - 5
    ['Way too low!', 'red']
  elsif guess.to_i < number
    ['Too low!', 'pink']
  end
end
