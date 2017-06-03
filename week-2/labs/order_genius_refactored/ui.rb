class UI
  def exit_with_message(message)
    puts message
    exit
  end

  def list_restaurants(restaurants)
    restaurants.each do |row|
      puts row['name']
    end
  end

  def list_restaurants_with_tag(tag_name)
    restaurants = Restaurant.with_tag_name(tag_name)
    exit_with_message "No restaurants with tag \"#{tag_name}\"" unless restaurants.any?
    list_restaurants(restaurants)
  end

  def list_tags
    Tag.all.each do |row|
      puts row['name']
    end
  end
end
