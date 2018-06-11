require 'sinatra'
require 'pg'
require_relative 'config/database'
require_relative 'models/restaurant'

get '/' do
  restaurants = Restaurant.all.map do |row|
    "<li>#{row['name']}</li>"
  end

  "<ul>#{restaurants.join}</ul>"
end
