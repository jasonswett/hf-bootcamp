require 'pg'
require_relative 'my_active_record'

class Restaurant < MyActiveRecord
  def self.table_name
    'restaurants'
  end

  def self.with_tag_name(tag_name)
    query = %Q(
      SELECT DISTINCT restaurants.*
                 FROM restaurants
                 JOIN restaurant_tags ON restaurant_tags.restaurant_id = restaurants.id
                 JOIN tags ON restaurant_tags.tag_id = tags.id
                WHERE LOWER(tags.name) = LOWER($1)
    )

    @@connection.exec_params(query, [tag_name])
  end

  def self.create(options)
    query = %Q(
      INSERT INTO restaurants (name, phone)
                       VALUES ($1, $2)
    )

    @@connection.exec_params(
      query,
      [options[:name], options[:phone]]
    )
  end
end
