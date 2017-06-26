require 'pg'
require_relative 'my_active_record'

class MenuItem < MyActiveRecord
  def self.table_name
    'menu_items'
  end

  def self.find_by_restaurant_id(restaurant_id)
    query = %Q(
      SELECT #{table_name}.*
        FROM #{table_name}
       WHERE restaurant_id = $1
    )

    @@connection.exec_params(query, [restaurant_id]);
  end
end
