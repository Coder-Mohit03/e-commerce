require_relative '../modules/cart_module'

class Cart 
  extend CartMod
  attr_accessor :product_name,:quantity,:product_no,:price
  def initialize(product_no,quantity,product_name,price)
    @product_no = product_no
    @quantity = quantity
    @product_name = product_name
    @price = price
  end

  def display
    print "product : #{product_name}, Quantity : #{quantity}, price : #{price}"
  end

  def write_in_file
    "#{product_no},#{quantity},#{product_name},#{price}"
  end

end

  
cart = []
