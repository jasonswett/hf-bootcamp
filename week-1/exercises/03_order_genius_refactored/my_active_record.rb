class MyActiveRecord
  @@connection = PG::Connection.open(dbname: 'order_genius')
end
