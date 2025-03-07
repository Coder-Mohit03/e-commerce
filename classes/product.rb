# $LOAD_PATH << '.'
# require 'modules/Product_module'
require_relative '../modules/Product_module'

class ProductClass 
extend ProductMod
  attr_accessor :product_name,:cat,:sub_cat,:brand,:size,:color,:price,:description,:is_for_sale,:quantity
  def initialize(product_name,cat,sub_cat,price,brand,size,color,description,is_for_sale=0,quantity=1)
    @product_name = product_name.downcase
    @cat = cat.downcase
    @sub_cat = sub_cat
    @price = price.to_i
    @brand = brand.downcase
    @size = size
    @color = color.downcase
    @description = description
    @is_for_sale = is_for_sale
    @quantity = quantity
  end
  def display
    puts "Product name : #{product_name}, Price : #{price}, description : #{description}"
  end
end



# Product.add_product(products)
# ProductClass.product_listening(products)

# Category.product_search(categories,products)
# Category.product_filter(categories,products)