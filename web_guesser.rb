require 'sinatra'

get '/' do
  "The secret number is #{rand(101)}"
end
