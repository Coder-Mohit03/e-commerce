module ProductMod

  def add_product
    list = {"product Name"=>nil,"Category"=>nil,"Price"=>nil,"Brand"=>nil,"Size"=>nil,"Color"=>nil,"Description"=>nil}
    i=0
    keys = list.keys
    while(i<keys.length)
      print "Please enter #{keys[i]} "
      list["#{keys[i]}"] = gets.chomp
      if(list["#{keys[i]}"]=="")
        puts "warning :Field can not be empty - "
        redo
      elsif(keys[i]=="Size" && !list["#{keys[i]}"].match?(/\d{2}/))
        puts "\nwarning : invalid size -"
        redo
      elsif(keys[i]=="product Name" && !list["#{keys[i]}"].match?(/[a-zA-Z ]/))
        puts "\nwarning : product name can only contains alphabates -"
        redo
      elsif(keys[i]=="Color" && !list["#{keys[i]}"].match?(/^(blue|black|white|red)$/))
        puts "\nPlease add color in blue,black,white,red"
        redo
      elsif(keys[i]=="Category")
        lines = File.readlines("csv_files/categories.csv")
        aFile = File.open("csv_files/categories.csv","r+")
        c = false
        if aFile
          lines.each do |line|
            category = line.chomp
            if category==list["#{keys[i]}"]
              c = true
            end
          end
          if c == false
            puts "sorry category not found!\n"
            redo
          end
        end
      elsif(keys[i]=="Price" && !list["#{keys[i]}"].match?(/^\$?\d{1,3}(?:,\d{3})*(?:\.\d{2})?$/))
        puts "warning : invalid Price - "
        redo 
      end
      i+=1
    end
    values = list.values
    product = ProductClass.new(*values)
    aFile = File.open("csv_files/products.csv","a+")
    if aFile
      values = product.write_in_file
      aFile.puts values
    end
    aFile.close
    puts "\nProduct added successfully - "
  end

  def product_on_sale(products) 
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

