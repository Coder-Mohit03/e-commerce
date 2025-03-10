module CartMod
  def add_to_cart(products,users,)
    product_no = 
    quantity = 
    while(1)
      print "Enter the product number to add to the cart: "
      product_no = gets.chomp
      product = products.find {|product| product.product_no==product_no}
      break if(product_no.match?(/[0-9]/) && !product.nil?)
      print "#{product.nil? ? 'Sorry product not found, enter correct number - ':'wrong input, try again - ' }\n"
    end
    while(1)
      print "Enter the quantity: "
      quantity = gets.chomp.to_i
      product = products.find {|product| product.quantity>=quantity}
      break if(product_no.match?(/[0-9]/) && !product.nil?)
      print "#{product.nil? ? 'you entered wrong quantity limit, try again - ':'wrong input, try again - ' }\n"
    end

  end
end