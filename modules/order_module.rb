module OrderMod
  def order_history(person)
    puts person.orders.length==0 ? 'No orders' : 'Order History - '
    person.orders.each do |order|
      order.show_order
    end
  end

  
  def checkout(user)
    if user.cart.length==0
      puts "cart is empty, No Orders in the cart to proceed - "
      return 
    end
    while(1)
      print "shipping address : "
      shipping_address = gets.chomp
      break if shipping_address!=""
      print "shipping address could not be empty - "
    end
    while(1)
      print "City : "
      city = gets.chomp
      break if city!=""
      print "city could not be empty - "
    end
    while(1)
      print "state : "
      state = gets.chomp
      break if state!=""
      print "state could not be empty - "
    end
    while(1)
      print "zip : "
      zip = gets.chomp
      break if zip.match?(/^\d{6}$/)
      print "invalid zip code or it could not be empty - "
    end
    while(1)
      print "Enter your credit card number : "
      card_no = gets.chomp
      break if card_no.match?(/^\d{4}\d{4}\d{4}\d{4}$/)
      print "invalid credit card number or it could not be empty - "
    end
    while(1)
      print "Enter the expiration date (MM/YY): "
      expiration_date = gets.chomp
      break if expiration_date.match?(/^([0-1][0-9])\/([0-9]{2}|[0-9]{4})$/)
      print "invalid expiration date or it could not be empty - "
    end
    while(1)
      print "Enter the CVV:  "
      cvv_no = gets.chomp
      break if cvv_no.match?(/^\d{3}$/)
      print "invalid cvv no. or it could not be empty - "
    end

    # lines = File.readlines("csv_files/cart.csv")
    # file = File.open("csv_files/cart.csv","r+")
    # order_product_no_arr = []
    # if file
    #   lines.each do |line|
    #     product_no,quantity,product_name,price = line.chomp.split(",")
    #     puts quantity , quantity.class
    #     order_product_no_arr.push({"product_no"=>product_no,"quant"=>quantity})
    #   end
    # end
    # b_lines = File.readlines("csv_files/products.csv")
    # bFile = File.open("csv_files/products.csv","r+")
    # i=0
    # total_amount=0

    # if bFile
      # b_lines.each do |line|
      #   while(i<order_product_no_arr.length)
      #     product_name,category,product_no,price,brand,size,color,description,is_for_sale,quantity = line.chomp.split(",")
      #     if order_product_no_arr[i]["product_no"].to_s == product_no.to_s
      #       quantity -= order_product_no_arr["quant"].to_i
      #       total_amount+=price
      #       file.puts line if quantity!=0
      #     else
      #       file.puts line
      #     end
      #     i+=1
      #   end
      #   Order.new(total_amount)
      # end
    # end
    
    # lines = File.readlines("csv_files/products.csv")
    # File.open("csv_files/products.csv","w+") do |file|
    #   lines.each do |line|
    #     product_name,category,product_no = line.chomp.split(",")
    #     if product_no != inp_product_no
    #       file.puts line 
    #     else
    #       deleted_element = true
    #     end
    #   end
    # end

    total_amount = 0

    lines = File.readlines("csv_files/products.csv")
    
    user.cart.each do |order|
      file = File.open("csv_files/products.csv","w+")
      pr_no = order.product_no
      qu = order.quantity
      lines.each do |line|
        product_name,category,product_no,price,brand,size,color,description,quantity =  line.chomp.split(",")
        if pr_no == product_no
          quantity=quantity.to_i-qu.to_i
          total_amount+=(price.to_i*qu.to_i)
          file.puts [product_name,category,product_no,price,brand,size,color,description,quantity].join(",") if quantity.to_i>0
          if(quantity.to_i<0)
            file.puts [product_name,category,product_no,price,brand,size,color,description,quantity.to_i+qu.to_i].join(",")
            puts "order failed, product out of stock"
            file.close
            return 0
          end
        elsif(quantity!=0)
          file.puts [product_name,category,product_no,price,brand,size,color,description,quantity].join(",")
        end
      end
      file.close
    end
    order = Order.new(rand(1000..10000),Time.now.strftime("%F"),total_amount,user.user_id)
    user.orders.push(order)
    puts order.show_order
    file = File.open("csv_files/orders.csv","a+")
    if file
      file.puts order.write_in_file
    end
    file.close
    puts "Order placed successfully! Order ID: #{order.order_id} "
    user.cart = []
    lines = File.readlines("csv_files/cart.csv")
    cart_file = File.open("csv_files/cart.csv","w+")
    if cart_file
      lines.each do |line|
        if line.chomp.split(",")[-1].to_i != user.user_id.to_i
          cart_file.puts line
        end
      end
      cart_file.close
    end
  end

end