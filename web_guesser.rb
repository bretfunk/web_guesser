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

def filter(guess, number)
  if guess.nil?
  elsif guess == number
    "You got it right!  The SECRET NUMBER is #{number}"
  elsif guess > number
    guess - 5 > number ? "Way too high! #{number}" : "Too high!  #{number}"
  elsif guess < number
    guess + 5 < number ? "Way too low! #{number}" : "Too low! #{number}"
  end
end

def message(guess, number)
  new_guess = guess.to_i unless nil
  filter(new_guess, number)
end
