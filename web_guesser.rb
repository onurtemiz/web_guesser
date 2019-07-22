# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

randNumber = rand(101)

def check_guess(guess, randNumber)
  guess = guess.to_i
  if guess == randNumber
    message = 'Correct!'
    return message
  elsif guess + 5 < randNumber
    message = 'Way Too Low!'
    return message
  elsif guess > randNumber + 5
    message = 'Way Too High!'
    return message
  elsif guess < randNumber
    message = 'Too Low!'
    return message
  elsif guess > randNumber
    message = 'Too High!'
    return message
  end
end

get '/' do
  message = check_guess(params['guess'], randNumber)
  secret = "The SECRET NUMBER is #{randNumber}" if message == 'Correct!'
  erb :index, locals: { randNumber: randNumber, message: message,secret: secret }
end
