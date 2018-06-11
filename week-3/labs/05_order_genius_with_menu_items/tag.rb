require_relative 'config'

class Tag < ActiveRecord::Base
  has_many :restaurant_tags
  has_many :restaurants, through: :restaurant_tags
end
