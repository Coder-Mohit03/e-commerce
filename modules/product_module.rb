module ProductMod

  def add_product
    lines = File.readlines("csv_files/categories.csv")
    aFile = File.open("csv_files/categories.csv","r+")
    if lines.length!=0
      puts "\nHere is the list of categories-\n"
      if aFile
        lines.each do |line|
          puts line
        end
      end
      aFile.close
    end
    list = {"product Name"=>nil,"Category"=>nil,"Price"=>nil,"Brand"=>nil,"Size"=>nil,"Color"=>nil,"Description"=>nil,"Quantity"=>nil}
    i=0
    keys = list.keys
    while(i<keys.length)
      print "Please enter #{keys[i] == "Color" ? "Color in blue,black,white,red" : keys[i]=="Size" ? "size only 1 or 2 digits allowed": keys[i] } "
      list["#{keys[i]}"] = gets.chomp
      if(list["#{keys[i]}"]=="")
        puts "warning :Field can not be empty - "
        redo
      elsif(keys[i] == "Quantity" && !list[keys[i]].match(/[0-9]/))
        puts "Warning : Invalid Quantity -"
        redo
      elsif(keys[i]=="Size" && !list["#{keys[i]}"].match(/^\d{1,2}$/))
        puts "\nwarning : invalid size only 1 or 2 digits allowed - "
        redo
      elsif(keys[i]=="product Name" && !list["#{keys[i]}"]&.match(/[a-zA-Z ]/))
        puts "\nwarning : product name can only contains alphabates -"
        redo
      elsif(keys[i]=="Color" && !list["#{keys[i]}"].match(/^(blue|black|white|red)$/))
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
      elsif(keys[i]=="Price" && !list["#{keys[i]}"].match?(/^\d{2,4}$|^10000$/))
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

  def product_listings
    lines = File.readlines("csv_files/products.csv")
    File.open("csv_files/products.csv","r") do |file|
      if lines.length!=0
        puts "Products Listings : " 
      else
        puts "Sorry, No products available right now"
      end
      lines.each do |line|
        product_name,category,product_no,price,brand,size,color,description,quantity =  line.chomp.split(",")
          puts "Product Name: #{product_name}, Category: #{category}, Product No. #{product_no}, Price: #{price}, Size #{size}, Color: #{color}, Product Description: #{description}" 
        # puts line
      end
    end
  end

  def edit_product_value(products)
    begin
      print "enter product_no to update product : "
      inp_product_no = gets.chomp.to_i
      lines = File.readlines("csv_files/products.csv")
      File.open("csv_files/products.csv","r+") do |file|
        lines.each do |line|
          product_name,category,product_no,price,brand,size,color,description,quantity =  line.chomp.split(",")
          if inp_product_no==product_no
            print "what do you want to update from the product: "
              update_key = gets.chomp
          end
        end
      end
    rescue
      print "invalid input , please try again - "
      retry if product.nil?
    end
  end

  def delete_product
    print "Enter product No. to delete the product : "
    inp_product_no = gets.chomp
    deleted_element = nil

    lines = File.readlines("csv_files/products.csv")
    File.open("csv_files/products.csv","w+") do |file|
      lines.each do |line|
        product_name,category,product_no = line.chomp.split(",")
        if product_no != inp_product_no
          file.puts line 
        else
          deleted_element = true
        end
      end
    end

    print "#{deleted_element==nil ? 'invalid product id or not found':'product deleted successfully'}\n"
  end

  def show_products
    lines = File.readlines("csv_files/products.csv")
    File.open("csv_files/products.csv","r+") do |file|
      lines.each do |line|
        product_name,category,product_no,price,brand,size,color,description,quantity =  line.chomp.split(",")
          puts "Product Name: #{product_name}, Category: #{category}, Product No. #{product_no}, Price: #{price}, Size #{size}, Color: #{color}, Product Description: #{description}, Quantity: #{quantity}" 
      end
    end
  end
end

