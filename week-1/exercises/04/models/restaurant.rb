class Restaurant
  def self.all
    $connection.exec_params('SELECT * FROM restaurants');
  end
end
