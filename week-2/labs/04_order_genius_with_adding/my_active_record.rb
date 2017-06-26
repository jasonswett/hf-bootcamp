class MyActiveRecord
  @@connection = PG::Connection.open(dbname: 'order_genius')

  def self.all
    @@connection.exec_params("SELECT * FROM #{table_name} order by name")
  end

  def self.find_by_name(name)
    query = %Q(
      SELECT #{table_name}.*
        FROM #{table_name}
       WHERE LOWER(name) = LOWER($1)
    )

    @@connection.exec_params(query, [name]);
  end
end
