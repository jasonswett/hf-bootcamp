#!/usr/bin/env ruby

require_relative './ui.rb'
require_relative './tag.rb'
require_relative './restaurant.rb'

ui = UI.new

if ARGV[0] == 'tags' || ARGV[0].nil?
  ui.list_tags
  exit
end

unless Tag.find_by_name(ARGV[0]).any?
  ui.exit_with_message "No such tag \"#{ARGV[0]}\""
end

ui.list_restaurants_with_tag(ARGV[0])
