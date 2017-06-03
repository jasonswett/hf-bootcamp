#!/usr/bin/env ruby

require 'pg'
require_relative './ui.rb'
require_relative './tag.rb'
require_relative './restaurant.rb'

connection = PG::Connection.open(dbname: 'order_genius')
ui = UI.new

if ARGV[0] == 'tags' || ARGV[0].nil?
  ui.list_tags(connection)
  exit
end

unless Tag.find_by_name(connection, ARGV[0]).any?
  ui.exit_with_message "No such tag \"#{ARGV[0]}\""
end

ui.list_restaurants_with_tag(connection, ARGV[0])
