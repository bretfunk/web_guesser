require 'sinatra'
require 'sinatra/reloader'

number = rand(100)


get '/' do
  erb :index, :locals => {
    :number => number,
    :user_guess => params["guess"],
    :message => message(params["guess"], number)
  }
end

def message(guess, number)
  if guess.nil?
  elsif guess.to_i == number
    "You got it right!  The SECRET NUMBER is #{number}"
  elsif guess.to_i > number
    guess.to_i - 5 > number ? "Way too high!" : "Too high!"
  elsif guess.to_i < number
    guess.to_i + 5 < number ? "Way too low!" : "Too low!"
  end
end
