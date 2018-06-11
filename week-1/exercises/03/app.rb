require 'sinatra'
require 'pg'

connection = PG::Connection.open(dbname: 'order_genius')

get '/' do
  result = connection.exec_params('SELECT * FROM restaurants');

  restaurants = result.map do |row|
    row['name']
  end

  restaurants.join(',')
end
