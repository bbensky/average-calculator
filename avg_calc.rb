require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

helpers do
  def integer?(num)
    num.to_i == num
  end
end

get '/' do
  numbers = params[:query].split(/\W+/).map(&:to_i) unless !params[:query]

  unless numbers.nil? || numbers.empty?
    @average = (numbers.reduce(:+) / numbers.size.to_f).round(2)
  end
  
  erb :index
end