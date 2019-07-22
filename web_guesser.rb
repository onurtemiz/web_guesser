require 'sinatra'
require 'sinatra/reloader'

randNumber = rand(101)


get '/' do 
  erb :index, :locals => {:randNumber => randNumber}
end

