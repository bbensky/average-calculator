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
  numbers = params[:query].split(/\W+/).map(&:to_i) unless !params[:query]

  unless numbers.nil? || numbers.empty?
    average = numbers.reduce(:+) / numbers.size.to_f
    @formatted_average = format_number(average)
  end
  
  erb :index
end