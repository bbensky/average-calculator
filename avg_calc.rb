require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

def integer?(num)
  num.to_i == num
end

def format_number(num)
  rounded_num = num.round(2)
  integer?(rounded_num) ? rounded_num.to_i : rounded_num
end

get '/' do
  numbers = params[:query].split(/[^1-9.]/).map(&:to_f) unless !params[:query]

  unless numbers.nil? || numbers.empty?
    average = numbers.reduce(:+) / numbers.size
    @formatted_average = format_number(average)
  end
  
  erb :index
end