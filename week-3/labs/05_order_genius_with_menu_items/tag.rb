require 'pg'
require_relative 'my_active_record'

class Tag < MyActiveRecord
  def self.table_name
    'tags'
  end
end
