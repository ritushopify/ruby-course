module InventoryModule
  def to_s
    name
  end
end

class Merchant
  include InventoryModule
  attr_accessor :name, :locations
  attr_reader :products
  def initialize(name = 'a Merchant Name')
    @name = name
    @locations = []
    @products = []
  end

  def products=(the_products)
    @products = the_products
    locations.each { |loc| loc.products = the_products }
  end
end

class Location
  include InventoryModule
  attr_accessor :name, :inventory
  def initialize(name = 'a Location Name')
    @name = name
    @inventory = []
  end

  def products=(the_products)
    @inventory = the_products.map do |product|
      InventoryItem.new(product)
    end
  end

  def list_inventory
    inventory.each do |item|
      puts item
    end
  end
end

class InventoryItem
  attr_accessor :product, :quantity
  def initialize(product)
    @product = product
    @quantity = 0
  end

  def to_s
    "product: #{product}, quantity: #{quantity}"
  end
end

class Product
  include InventoryModule
  attr_accessor :name
  def initialize(name = 'aProduct Name')
    @name = name
  end
end

m = Merchant.new('Merchant 1')
p1 = Product.new('Product M1P1')
p2 = Product.new('Product M1P2')
p3 = Product.new('Product M1P3')
l1 = Location.new('Location M1L1')
l2 = Location.new('Location M1L2')
m.locations = [l1, l2]
m.products = [p1, p2, p3]
l1.inventory.each_with_index do |item, index|
  item.quantity = index + 10
end
puts "Created merchant named #{m}"
puts 'This merchant has these locations:'
puts m.locations
puts 'and these products:'
puts m.products
puts 'Here is the inventory at each location:'
m.locations.each do |loc|
  puts loc
  loc.list_inventory
end
