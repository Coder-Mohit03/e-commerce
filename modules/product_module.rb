module ProductMod

  def add_product(products)
    list = {"product_name"=>nil,"cat"=>nil,"price"=>nil,"brand"=>nil,"size"=>nil,"color"=>nil,"description"=>nil}
    product_name,cat,product_no,price,brand,size,color,description,is_for_sale=0
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
    product = ProductClass.new(*values)
    aFile = File.open("products.csv","a+")
    if aFile
      product.instance_variables.each do |var|
        value = instance_variable_get(var)
        aFile.write("#{value},") 
      end
      aFile.puts
    end
    aFile.close

    products.push(product)
    # p products[0]
  end

  def product_listening(products) 
    products_for_sale =  products.select {|product| product.is_for_sale==1}
    puts "Items for sale: "
    products_for_sale.each do |product|
      puts "Name : #{product.product_name}, Price : #{product.price}"  
    end
  end

  def edit_product_value(products)
    begin
      print "enter product_no to update product : "
      product_no = gets.chomp.to_i
      product = products.find {|product| product.product_no==product_no}
      product.edit_product(products)
    rescue
      print "invalid input , please try again - "
      retry if product.nil?
    end
  end

  def delete_product(products)
    print "Enter product No. to delete the product : "
    product_no = gets.chomp.to_i
    deleted_element = nil

    products.each do |product|
      if(product.product_no == product_no)
        deleted_element = products.delete(product)
      end
    end     
    puts deleted_element
    print "#{deleted_element==nil ? 'invalid product id or not found':'product deleted successfully'}\n"
  end

  def show_products(products)
    products.each do |product|
      product.display
    end
  end
end

