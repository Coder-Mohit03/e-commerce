require_relative 'modules/cart_module'
class Cart 
  extend CartMod
  def initialize(product_no,quantity)
    @product_no = product_no
    @quantity = quantity
  end

end