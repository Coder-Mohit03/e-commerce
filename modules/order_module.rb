module OrderMod
  def order_history(orders)
    puts orders.length==0 ? 'No orders' : 'Order History - '
    orders.each do |order|
      order.show_order
    end
  end
end