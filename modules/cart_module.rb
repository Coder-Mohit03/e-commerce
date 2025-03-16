module CartMod

  def add_to_cart(user)
    # _product_no = 
    while(1)
      print "Enter the product number to add to the cart: "
      inp_product_no = gets.chomp
      flag = false
      lines = File.readlines("csv_files/products.csv")
      file = File.open("csv_files/products.csv","r+")
      if file
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

end