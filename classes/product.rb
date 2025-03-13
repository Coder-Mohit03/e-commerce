# $LOAD_PATH << '.'
# require 'modules/Product_module'
require_relative '../modules/product_module'

class ProductClass 
extend ProductMod
  attr_accessor :product_name,:category,:product_no,:brand,:size,:color,:price,:description,:is_for_sale,:quantity
  
  def initialize(product_name,category,price,brand,size,color,description,is_for_sale=0,quantity=1)
    lines = File.readlines("csv_files/products.csv")
    @@counter = lines[-1].split(",")[2].to_i+1
    @product_name = product_name.downcase
    @category = category.downcase
    @product_no = @@counter
    @price = price.to_i
    @brand = brand.downcase
    @size = size
    @color = color.downcase
    @description = description
    @is_for_sale = is_for_sale
    @quantity = quantity.to_i
  end
  def display
    puts "Product Name : #{product_name}, Price : #{price}, Color = #{color}, Size : #{size},  Description : #{description}, Product No : #{product_no}"
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

  def write_in_file
    "#{product_name},#{category},#{product_no},#{price},#{brand},#{size},#{color},#{description},#{is_for_sale},#{quantity}"
  end
end



# Product.add_product(products)
# ProductClass.product_listening(products)

# Category.product_search(categoryegories,products)
# Category.product_filter(categoryegories,products)