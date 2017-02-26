# Add items for menu - done
# Remove items from menu - done
# Set prices - done
# Receives final order
# Confirms order received by text
require_relative 'menu'
require 'CSV'

class Restaurant
  attr_reader :menu

  def initialize
    @menu = []
  end

  def add_item_to_menu(food, price)
    # Raise error if try to add identitcal key-value pair more than once
    @menu << { :food => food, :price => price }
  end

  def add_file_to_menu(csv = './lib/test_menu.csv')
    file = CSV.foreach(csv) do |row|
      add_item_to_menu(row[0], row[1])
    end
  end

  def remove_from_menu(dish)
    @menu.reject! { |item| item == dish }
  end
end
