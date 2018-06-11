require_relative 'config'

class Restaurant < ActiveRecord::Base
  has_many :restaurant_tags
  has_many :tags, through: :restaurant_tags
end
