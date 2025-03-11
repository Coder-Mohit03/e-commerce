module CartMod

  def add_to_cart
    # _product_no = 
    while(1)
      print "Enter the product number to add to the cart: "
      inp_product_no = gets.chomp
      flag = false
      lines = File.readlines("csv_files/products.csv")
      aFile = File.open("csv_files/products.csv","r+")
      if aFile
        lines.each do |line|
          product_name,category,product_no,price,brand,size,color,description,is_for_sale,quantity =  line.chomp.split(",")
          if product_no == inp_product_no
            flag = true
            quantity_check(quantity,product_no,product_name,price)
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
  def quantity_check(quant,product_no,product_name,price)
    while(1)
      print "Enter the quantity: "
      quantity = gets.chomp
      break if(quant >= quantity && quantity.match?(/[0-9]/) )
      print "#{quantity.nil? ? 'decrease quantity limit, out of stock, try again - ':'wrong input, try again - ' }\n"
    end
    product = Cart.new(product_no,quantity,product_name,price)
    File.open("csv_files/cart.csv","a+") do |file|
      file.puts product.write_in_file
      puts "Product added to the cart"
    end
  end

  def show_cart
    puts "\nCart:"
    cart.each do |product|
      product.display
    end
  end

  def checkout(cart,orders,products)
    while(1)
      print "shipping address : "
      shipping_address = gets.chomp
      break if shipping_address!=nil
      print "shipping address could not be empty - "
    end
    while(1)
      print "shipping address : "
      city = gets.chomp
      break if city!=nil
      print "city could not be empty - "
    end
    while(1)
      print "state : "
      state = gets.chomp
      break if state!=nil
      print "state could not be empty - "
    end
    while(1)
      print "zip : "
      zip = gets.chomp
      break if zip.match?(/^\d{5}(-\d{4})?$/)
      print "invalid zip code or it could not be empty - "
    end
    while(1)
      print "Enter your credit card number : "
      card_no = gets.chomp
      break if card_no.match?(/^\d{4} \d{4} \d{4} \d{4}$/)
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
    lines = File.readlines("csv_files/cart.csv")
    aFile = File.open("csv_files/cart.csv","r+")
    order_product_no_arr = []
    if aFile
      lines.each do |line|
        product_no,quantity,product_name,price = line.chomp.split(",")
        order_product_no_arr.push({"product_no"=>product_no,"quant"=>quantity})
      end
    end
    bFile = File.open("csv_files/products.csv","w+")
    b_lines = File.readlines("csv_files/products.csv")
    total_amount=0
    if bFile
      b_lines.each do |line|
        while(i<order_product_no_arr.length)
          product_name,category,product_no,price,brand,size,color,description,is_for_sale,quantity = line.chomp.split(",")
          if order_product_no_arr["product_no"] == product_no
            quantity -= order_product_no_arr["quant"]
            total_amount+=price
            aFile.puts line if quantity!=0
          else
            aFile.puts line
          end
        end
      end
    end
    # order_product_no_arr = cart.select {|product| product.product_no }
    
    # puts order_product_no_arr

    # order = Order.new()
    # orders.push()

  end

end