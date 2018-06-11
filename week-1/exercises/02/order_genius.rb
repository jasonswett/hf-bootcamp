#!/usr/bin/env ruby

require 'pg'

connection = PG::Connection.open(dbname: 'order_genius')
result = connection.exec_params('SELECT * FROM restaurants');

result.each do |row|
  puts row['id']
  puts row['name']
  puts row['phone']
  puts
end
