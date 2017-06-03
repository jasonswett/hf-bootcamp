#!/usr/bin/env ruby

require 'pg'
require_relative './tag.rb'
require_relative './restaurant.rb'

connection = PG::Connection.open(dbname: 'order_genius')

if ARGV[0] == 'tags' || ARGV[0].nil?
  Tag.all(connection).each do |row|
    puts row['name']
  end

  exit
end

result = Tag.find_by_name(connection, ARGV[0])

unless result.any?
  puts "No such tag \"#{ARGV[0]}\""
  exit
end

unless Restaurant.with_tag_name(connection, ARGV[0]).any?
  puts "No restaurants with tag \"#{ARGV[0]}\""
  exit
end

result.each do |row|
  puts row['name']
end
