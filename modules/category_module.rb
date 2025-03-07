module CategoryMod

  def product_search(categories,products)
    while(1)
      print "Enter category / product name: "
      search_key = gets.chomp.downcase
      break if(search_key.length!=0)
      print "Invalid name, please try again - "
    end

    search = categories.find {|category| category.category_name==search_key}
    if(search.nil?)
      product = products.find {|product| product.product_name==search_key}
      product.display
    else
      cat_items = products.select {|product| product.cat==search_key }
      cat_items.each do |item|
        item.display
      end
    end
  end

  def product_filter(categories,products)
    _brand = 
    _size = 
    cat = 
    _color = 
    while(1)
      print "Enter category : "
      category = gets.chomp
      cat = products.find {|product| product.cat==category}
      puts cat
      break if(cat)
      print "Invalid category / category not found, please try again - "
    end

    while(1)
      print "Enter Brand : "
      brand = gets.chomp.downcase
      product = products.find {|product| product.brand==brand}
      _brand = product&.brand
      break if(_brand)
      print "Invalid brand / Brand not found, please try again - "
    end

    while(1)
      print "Enter Size : "
      size = gets.chomp
      product = products.select {|product| product.brand==_brand && product.size == size}
      _size = size
      break if(product.length!=0)
      print "Invalid size / Size not found, please try again - "
    end
    
    while(1)
      print "Enter Color : "
      color = gets.chomp.downcase
      product = products.select {|product| product.brand==_brand && product.size==_size && product.color == color}
      _color = color
      break if(product.length!=0)
      print "Invalid color / Color not found, please try again - "
    end
    puts "Products based on your filter - "
    filter_products = product.select {|product| product.brand==_brand && product.size==_size && product.color==_color} 
    filter_products.each do |product|
      product.display
    end
  end
  
end