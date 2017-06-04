require_relative 'config'
require_relative 'restaurant_tag'
require_relative 'tag'
require 'active_record'

class Restaurant < ActiveRecord::Base
  has_many :restaurant_tags
  has_many :tags, through: :restaurant_tags
end
