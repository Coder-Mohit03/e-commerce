# $LOAD_PATH << '.'
# require 'modules/Product_module'
require_relative '../modules/product_module'

class ProductClass 
extend ProductMod
  attr_accessor :product_name,:cat,:product_no,:brand,:size,:color,:price,:description,:is_for_sale,:quantity
  @@counter = 0
  def initialize(product_name,cat,price,brand,size,color,description,is_for_sale=0,quantity=1)
    @@counter+=1
    @product_name = product_name.downcase
    @cat = cat.downcase
    @product_no = @@counter
    @price = price.to_i
    @brand = brand.downcase
    @size = size
    @color = color.downcase
    @description = description
    @is_for_sale = is_for_sale
    @quantity = quantity
  end
  def display
    puts "Product name : #{product_name}, Price : #{price}, color = #{color}, size : #{size},  description : #{description}, product_no : #{product_no}"
  end

  def edit_product(products)
    begin
      print "what do you want to edit in the product : "
      edit_key = gets.chomp.downcase
      var = products[0].instance_variable_get("@#{edit_key}")
      print var
      if var
        print "enter updated value for #{edit_key}: "
        newVal = gets.chomp.downcase
        instance_variable_set("@#{edit_key}",newVal)
        puts "product updated successfully\n"
        return 
      else
        raise "error"
      end
    rescue
      print "\nwrong input please try again - \n"
      retry
    end
  end
end



# Product.add_product(products)
# ProductClass.product_listening(products)

# Category.product_search(categories,products)
# Category.product_filter(categories,products)