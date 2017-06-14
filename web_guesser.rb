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
  elsif guess.to_i > number + 5
    "Way too high!"
  elsif guess.to_i > number
    "Too high!"
  elsif guess.to_i < number + 5
    "Way too low!"
  elsif guess.to_i < number
    "Too low!"
  elsif guess.to_i == number
    "You got it right!  \n The SECRET NUMBER is #{number}"
  end
end
