#!/usr/bin/env ruby

require_relative './ui.rb'
require_relative './tag.rb'
require_relative './restaurant.rb'

ui = UI.new

if ARGV[0] == 'tags' || ARGV[0].nil?
  ui.list_tags
  exit
end

if ARGV[0] == 'restaurants'
  ui.list_restaurants(Restaurant.all)
  exit
end

if ARGV[0] == 'restaurant_detail'
  restaurants = Restaurant.find_by_name(ARGV[1])
  ui.show_restaurant_detail(restaurants[0])
  exit
end

if ARGV[0] == 'add_restaurant'
  Restaurant.create(
    name: ARGV[1],
    phone: ARGV[2]
  )

  exit
end

unless Tag.find_by_name(ARGV[0]).any?
  ui.exit_with_message "No such tag \"#{ARGV[0]}\""
end

ui.list_restaurants_with_tag(ARGV[0])
