require_relative '../modules/order_module'
class Order
  attr_accessor :order_id,:date,:total_amount
  extend OrderMod
  @@id = 1000
  def initialize(total_amount)
    @@id+=1
    @order_id = @@id
    @date = Time.now.strftime("%F")
    @total_amount = total_amount
  end

end