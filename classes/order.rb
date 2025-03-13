require_relative '../modules/order_module'
class Order
  attr_accessor :order_id,:date,:total_amount
  extend OrderMod
  def initialize(total_amount)
    @order_id = rand(1000..10000)
    @date = Time.now.strftime("%F")
    @total_amount = total_amount
  end
  
  def show_order
    "Order id - #{order_id}, Date - #{date}, Total Amount - #{total_amount}"
  end


end