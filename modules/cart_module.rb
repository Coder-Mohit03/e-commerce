module CartMod
  def add_to_cart(products,users,cart)
    # _product_no = 
    # _quantity = 
    while(1)
      print "Enter the product number to add to the cart: "
      product_no = gets.chomp
      product = products.find {|product| product.product_no==product_no.to_i}
      if(product_no.match?(/[0-9]/) && !product.nil?)
        break
      end
      print "#{product.nil? ? 'Sorry product not found, enter correct number - ':'wrong input, try again - ' }\n"
    end

    while(1)
      print "Enter the quantity: "
      quantity = gets.chomp
      break if(product.quantity >= quantity.to_i && quantity.match?(/[0-9]/) )
      print "#{product.nil? ? 'you entered wrong quantity limit, try again - ':'wrong input, try again - ' }\n"
    end
    product = Cart.new(product_no,quantity,product.product_name,product.price)
    cart.push(product)
    puts "product added to the cart"
  end

  def show_cart(cart)
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

    order_product_no_arr = cart.select {|product| product.product_no }
    
    puts order_product_no_arr

    # order = Order.new()
    # orders.push()

  end
end