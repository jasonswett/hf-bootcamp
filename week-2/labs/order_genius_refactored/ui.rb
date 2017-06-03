class UI
  def exit_with_message(message)
    puts message
    exit
  end

  def list_restaurants_with_tag(connection, tag_name)
    restaurants = Restaurant.with_tag_name(connection, tag_name)
    unless restaurants.any?
      exit_with_message "No restaurants with tag \"#{tag_name}\""
    end

    restaurants.each do |row|
      puts row['name']
    end
  end

  def list_tags(connection)
    Tag.all(connection).each do |row|
      puts row['name']
    end
  end
end
