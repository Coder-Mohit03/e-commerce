require_relative '../modules/cart_module'

class Cart 
  extend CartMod
  attr_accessor :product_name,:quantity,:product_no,:price,:user_id
  def initialize(product_no,quantity,product_name,price,user_id)
    @product_no = product_no
    @quantity = quantity
    @product_name = product_name
    @price = price
    @user_id = user_id
  end

  def display_product
    print "product : #{product_name}, Quantity : #{quantity}, price : #{price}\n"
  end

  def write_in_file
    "#{product_no},#{quantity},#{product_name},#{price},#{user_id}"
  end

end

  
