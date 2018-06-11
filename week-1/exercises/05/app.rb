require 'sinatra'
require 'pg'
require_relative 'config/database'
require_relative 'models/restaurant'

get '/' do
  @restaurants = Restaurant.all
  erb :index
end
