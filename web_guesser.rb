# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

@@randNumber = rand(101)
@@life = 21


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

  def life_check(message)
    @@life -= 1
    if message == 'Correct!'
      @@life = 20
      @@randNumber = rand(101)
      return message
    elsif @@life == 0
      @@life =  20
      @@randNumber = rand(101)
      return 'You have lost. New number has been generated.'
    end
  end

get '/' do
  now_randNumber = @@randNumber
  message = check_guess(params['guess'], now_randNumber)
  color = color_check(message)
  secret = "The SECRET NUMBER is #{now_randNumber}" if message == 'Correct!' || params['cheat']
  message = life_check(message) unless life_check(message).nil?
  erb :index, locals: { randNumber: now_randNumber, message: message,secret: secret,color: color,life: @@life }
end
