require_relative '../modules/order_module'
class Order
  attr_accessor :order_id,:date,:total_amount,:user_id
  extend OrderMod
  def initialize(order_id,date,total_amount,user_id)
    @order_id = order_id
    @date = date
    @total_amount = total_amount.to_i
    @user_id = user_id
  end
  
  def show_order
    puts "Order id - #{order_id}, Date - #{date}, Total Amount - #{total_amount}"
  end

  def write_in_file
    "#{order_id},#{date},#{total_amount},#{user_id}"
  end

end