module ProductMod

  def add_product(products)
    list = {"product_name"=>nil,"cat"=>nil,"sub_cat"=>nil,"price"=>nil,"description"=>nil}
    i=0
    keys = list.keys
    while(i<keys.length)
      print "Please enter #{keys[i]} : "
      list["#{keys[i]}"] = gets.chomp
      if(keys[i]=="price" && !list["#{keys[i]}"].match?(/^\$?\d{1,3}(?:,\d{3})*(?:\.\d{2})?$/))
        print "warning : invalid - "
        redo 
      elsif(list["#{keys[i]}"]=="")
        print "warning : invalid - "
        redo
      end
      i+=1
    end
    values = list.values
    
    products.push(Product.new(*values))
    p products[0]
  end

  def product_listening(products) 
    products_for_sale =  products.select {|product| product.is_for_sale==1}
    puts "Items for sale: "
    products_for_sale.each do |product|
      puts "Name : #{product.product_name}, Price : #{product.price}"  
    end
  end

end

