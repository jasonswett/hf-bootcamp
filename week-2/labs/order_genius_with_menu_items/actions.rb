class Actions
  @@ui = UI.new

  def self.default
    unless Tag.find_by_name(ARGV[0]).any?
      @@ui.exit_with_message "No such tag \"#{ARGV[0]}\""
    end

    @@ui.list_restaurants_with_tag(ARGV[0])
  end

  def self.tags_list(args)
    @@ui.list_tags
    exit
  end

  def self.restaurants_list(args)
    @@ui.list_restaurants(Restaurant.all)
    exit
  end

  def self.restaurants_detail(args)
    restaurants = Restaurant.find_by_name(args[1])
    @@ui.show_restaurant_detail(restaurants[0])
    exit
  end

  def self.restaurants_add(args)
    Restaurant.create(name: args[1], phone: args[2])
    exit
  end
end
