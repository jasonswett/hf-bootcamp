#!/usr/bin/env ruby

require_relative 'ui'
require_relative 'actions'
require_relative 'tag'
require_relative 'restaurant'

ACTION_WHITELIST = %w(
  tags_list
  restaurants_list
  restaurants_detail
  restaurants_add
)

ARGV[0] = 'tags_list' if ARGV[0] == nil

Actions.send(ARGV[0], ARGV) if ACTION_WHITELIST.include?(ARGV[0])
Actions.default
