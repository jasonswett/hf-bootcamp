#!/usr/bin/env ruby

require 'pg'

connection = PG::Connection.open(dbname: 'order_genius')

if ARGV[0] == 'tags' || ARGV[0].nil?
  result = connection.exec_params('SELECT * FROM tags order by name')

  result.each do |row|
    puts row['name']
  end

  exit
end

query = %Q(
  SELECT tags.*
    FROM tags
   WHERE LOWER(tags.name) = LOWER($1)
)
result = connection.exec_params(query, [ARGV[0]]);

unless result.any?
  puts "No such tag \"#{ARGV[0]}\""
  exit
end

query = %Q(
  SELECT DISTINCT restaurants.*
             FROM restaurants
             JOIN restaurant_tags ON restaurant_tags.restaurant_id = restaurants.id
             JOIN tags ON restaurant_tags.tag_id = tags.id
            WHERE LOWER(tags.name) = LOWER($1)
)
result = connection.exec_params(query, [ARGV[0]]);

unless result.any?
  puts "No restaurants with tag \"#{ARGV[0]}\""
  exit
end

result.each do |row|
  puts row['name']
end
