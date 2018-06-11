require_relative 'config'

class RestaurantTag < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :tag
end
