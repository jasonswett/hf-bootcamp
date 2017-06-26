#!/usr/bin/env ruby

require_relative 'ui'
require_relative 'actions'
require_relative 'tag'
require_relative 'restaurant'

ACTION_WHITELIST = %w(
  tags
  restaurants
  restaurant_detail
  add_restaurant
)

ARGV[0] = 'tags' if ARGV[0] == nil

Actions.send(ARGV[0], ARGV) if ACTION_WHITELIST.include?(ARGV[0])
Actions.default
