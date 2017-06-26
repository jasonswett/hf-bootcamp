require 'pg'
require_relative './my_active_record'

class Tag < MyActiveRecord
  def self.all
    @@connection.exec_params('SELECT * FROM tags order by name')
  end

  def self.find_by_name(tag_name)
    query = %Q(
      SELECT tags.*
        FROM tags
       WHERE LOWER(tags.name) = LOWER($1)
    )

    @@connection.exec_params(query, [tag_name]);
  end
end
