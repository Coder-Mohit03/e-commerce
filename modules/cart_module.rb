module CartMod

  def add_to_cart(user)
    # _product_no = 
    while(1)
      print "Enter the product number to add to the cart: "
      inp_product_no = gets.chomp
      flag = false
      lines = File.readlines("csv_files/products.csv")
      aFile = File.open("csv_files/products.csv","r+")
      if aFile
        lines.each do |line|
          product_name,category,product_no,price,brand,size,color,description,quantity =  line.chomp.split(",")
          if product_no == inp_product_no
            flag = true
            added = quantity_check_and_add_to_cart(quantity,product_no,product_name,price,user)
            break
          end
        end
      end
      if(flag == true)
        break
      else
        print "Sorry product not found, enter correct number - \n"
      end
    end
  end
  def quantity_check_and_add_to_cart(quant,product_no,product_name,price,user)
    while(1)
      print "Enter the quantity: "
      quantity = gets.chomp
      if(quantity.to_i <= 0 )
        puts "Warning: Quantity could not be 0, Negative, empty or any character, only digits allowed - "
        redo
      elsif(quant.to_i >= quantity.to_i && quantity.match?(/[0-9]/)) 
        break
      else
        puts quantity.nil? ? 'Wrong input, try again - ' : "Sorry, we only have #{quant} items in stock. Please adjust your quantity to match the available stock."
      end
    end
    
    
    product = Cart.new(product_no,quantity,product_name,price,user.user_id)
    user.cart.push(product)
    
    File.open("csv_files/cart.csv","a+") do |file|
      file.puts product.write_in_file
      puts "Product added to the cart"
      file.close
    end
  end

  def checkout(cart,orders)
    if cart.length==0
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
    # aFile = File.open("csv_files/cart.csv","r+")
    # order_product_no_arr = []
    # if aFile
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
      #       aFile.puts line if quantity!=0
      #     else
      #       aFile.puts line
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
    
    cart.each do |order|
      file = File.open("csv_files/products.csv","w+")
      pr_no = order.product_no
      qu = order.quantity
      lines.each do |line|
        product_name,category,product_no,price,brand,size,color,description,quantity =  line.chomp.split(",")
        if pr_no == product_no
          total_amount+=price.to_i*qu.to_i
          quantity=quantity.to_i-qu.to_i
          file.puts [product_name,category,product_no,price,brand,size,color,description,quantity].join(",") if quantity.to_i!=0
        elsif(quantity!=0)
          file.puts [product_name,category,product_no,price,brand,size,color,description,quantity].join(",")
        end
      end
      file.close
    end
    order = Order.new(total_amount)
    orders.push(order)
    puts order.show_order
    aFile = File.open("csv_files/orders.csv","r+")
    if aFile
      aFile.puts order.show_order
    end
    aFile.close
    puts "Order placed successfully! Order ID: #{order.order_id} "
    cart = []
  end

end