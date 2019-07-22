# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

randNumber = rand(101)

def check_guess(guess, randNumber)
  guess = guess.to_i
  if guess == randNumber
    return 'Correct!'
  elsif guess + 5 < randNumber
    return 'Way Too Low!'
  elsif guess > randNumber + 5
    return 'Way Too High!'
  elsif guess < randNumber
    return 'Too Low!'
  elsif guess > randNumber
    return 'Too High!'
  end
end

def color_check(message)
  case message
  when 'Way Too High!'
    'red'
  when 'Too High!'
    'salmon'
  when 'Way Too Low!'
    'red'
  when 'Too Low!'
    'salmon'
  when 'Correct!'
    'green'
  end
end

get '/' do
  message = check_guess(params['guess'], randNumber)
  color = color_check(message)
  secret = "The SECRET NUMBER is #{randNumber}" if message == 'Correct!'
  erb :index, locals: { randNumber: randNumber, message: message,secret: secret,color: color }
end
