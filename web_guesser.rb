require 'sinatra'
require 'sinatra/reloader'

randNumber = rand(101)

get '/' do 
  "The secret number is #{randNumber}"
end

