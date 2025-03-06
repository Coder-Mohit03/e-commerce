class Product
  def initialize(product_name,cat,sub_cat,price,description)
    @product_name = product_name
    @cat = cat
    @sub_cat = sub_cat
    @price = price.to_i
    @description = description
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
  
end
products = []

Product.add_product(products)

