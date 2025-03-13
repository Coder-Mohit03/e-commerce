module CategoryMod

  def add_category
    begin
      print "Enter Category Name: "
      input_category = gets.chomp
      raise if input_category=="" || !input_category.match?(/^[a-zA-Z]+$/)
    rescue
      print "Invalid Category or field could not be empty\n"
      retry
    end
    lines = File.readlines("csv_files/categories.csv")
    aFile = File.open("csv_files/categories.csv","a+")
    flag = false
    if aFile
      lines.each do |line|
        category = line.chomp
        if category==input_category
          flag = true
        end
      end
      if flag==true
        puts "Category already exist!"
      else
        aFile.puts input_category
        puts "Category Added Successfully"
      end
    end
    aFile.close
  end

  def product_search
    while(1)
      print "Search Products : "
      search_key = gets.chomp.downcase
      break if(search_key.length!=0)
      print "Invalid input, please try again - "
    end
    lines = File.readlines("csv_files/products.csv")
    puts 'List Of Products - '
    aFile = File.open("csv_files/products.csv","r+")
    f = false
    if aFile
      lines.each do |line|
        product_name,category,product_no,price,brand,size,color,description,is_for_sale,quantity =  line.chomp.split(",")
        array = line.chomp.split(",")

        array.each do |word|
          if word.include?(search_key)
            puts "Product Name: #{product_name}, Category: #{category}, Product No. #{product_no}, Price: #{price}, Size #{size}, Color: #{color}, Product Description: #{description}" 
            f = true
            break
          end
        end
      end
      puts "sorry no such products are available - \n\n" if f==false
      aFile.close
    end

    # search = categories.find {|category| category.category_name==search_key}
    # if(search.nil?)
    #   product = products.find {|product| product.product_name==search_key}
    #   product.display
    # else
    #   cat_items = products.select {|product| product.cat==search_key }
    #   cat_items.each do |item|
    #     item.display
    #   end
    # end
  end

  # def product_filter(categories,products)
  #   _brand = 
  #   _size = 
  #   cat = 
  #   _color = 
  #   while(1)
  #     print "Enter category : "
  #     category = gets.chomp
  #     cat = products.find {|product| product.cat==category}
  #     puts cat
  #     break if(cat)
  #     print "Invalid category / category not found, please try again - "
  #   end

  #   while(1)
  #     print "Enter Brand : "
  #     brand = gets.chomp.downcase
  #     product = products.find {|product| product.brand==brand}
  #     _brand = product&.brand
  #     break if(_brand)
  #     print "Invalid brand / Brand not found, please try again - "
  #   end

  #   while(1)
  #     print "Enter Size : "
  #     size = gets.chomp
  #     product = products.select {|product| product.brand==_brand && product.size == size}
  #     _size = size
  #     break if(product.length!=0)
  #     print "Invalid size / Size not found, please try again - "
  #   end
    
  #   while(1)
  #     print "Enter Color : "
  #     color = gets.chomp.downcase
  #     product = products.select {|product| product.brand==_brand && product.size==_size && product.color == color}
  #     _color = color
  #     break if(product.length!=0)
  #     print "Invalid color / Color not found, please try again - "
  #   end
  #   puts "Products based on your filter - "
  #   filter_products = product.select {|product| product.brand==_brand && product.size==_size && product.color==_color} 
  #   filter_products.each do |product|
  #     product.display
  #   end
  # end
  
  def display_categories
    lines = File.readlines("csv_files/categories.csv")
    aFile = File.open("csv_files/categories.csv","r+")
    puts "\nlist of categories"
    if aFile
      lines.each do |line|
        puts line
      end
    end
    aFile.close
  end
  
  
end