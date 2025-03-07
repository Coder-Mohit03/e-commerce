class Product
  attr_accessor :product_name,:cat,:sub_cat,:price,:description,:is_for_sale
  def initialize(product_name,cat,sub_cat,price,description,is_for_sale=0)
    @product_name = product_name
    @cat = cat
    @sub_cat = sub_cat
    @price = price.to_i
    @description = description
    @is_for_sale = is_for_sale
  end

  def self.add_product(products)
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

  def self.product_listening(products) 
    products_for_sale =  products.select {|product| product.is_for_sale==1}
    puts "Items for sale: "
    products_for_sale.each do |product|
      puts "Name : #{product.product_name}, Price : #{product.price}"  
    end
  end
end
products = [Product.new("T-shirt","category","sub_cat",400,"lorem ipsum jeson",1),Product.new("sneaker","category","sub_cat",450,"lorem ipsum jeson",1),Product.new("jeans","category","sub_cat",550,"lorem ipsum jeson",0)]

# Product.add_product(products)
Product.product_listening(products)

