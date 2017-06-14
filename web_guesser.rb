require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
number = SECRET_NUMBER

get '/' do
  guess = params['guess']
  message = check_guess(guess, number)
  erb :index, locals: { number: number, message: message }
end

def check_guess(guess, number)
  if guess.nil?
  elsif guess.to_i == number
    "You got it right!  The SECRET NUMBER is #{number}"
  elsif guess.to_i > number
    guess.to_i - 5 > number ? 'Way too high!' : 'Too high!'
  elsif guess.to_i < number
    guess.to_i + 5 < number ? 'Way too low!' : 'Too low!'
  end
end
