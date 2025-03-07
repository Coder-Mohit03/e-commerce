$LOAD_PATH << '.'
require '../modules/Product_module'


class Category
  attr_accessor :category_name

  def initialize(category_name)
    @category_name = category_name.downcase
  end
  
  def display_categories(categories)
    categories.each_with_index do |category,i|
      puts "#{i+1} = #{category}"
    end
  end

  def self.product_search(categories,products)
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
    brand = 
    while(1)
      print "Enter Brand : "
      brand = gets.chomp.downcase
      break if(brand.length!=0)
      print "Invalid brand, please try again - "
    end
    while(1)
      print "Enter Size : "
      size = gets.chomp.downcase
      break if(size.length!=0)
      print "Invalid size, please try again - "
    end
    end
  end
end

class ProductClass 
extend ProductMod
  attr_accessor :product_name,:cat,:sub_cat,:price,:description,:is_for_sale
  def initialize(product_name,cat,sub_cat,price,brand,size,color,description,is_for_sale=0)
    @product_name = product_name.downcase
    @cat = cat.downcase
    @sub_cat = sub_cat
    @price = price.to_i
    @brand = brand
    @size = size
    @color = color
    @description = description
    @is_for_sale = is_for_sale
  end
  def display
    puts "Product name : #{product_name}, Price : #{price}, description : #{description}"
  end
end

products =[
ProductClass.new("yk_t-shirt","t-shirt","sub_cat",400,"yk","m","red","lorem ipsum jeson",1),
ProductClass.new("jm_t-shirt","t-shirt","sub_cat",400,"jm","s","black","lorem ipsum jeson",1),
ProductClass.new("jm_t-shirt20","t-shirt","sub_cat",400,"jm","l","white","lorem ipsum jeson",1),
ProductClass.new("HMF-jeans","jeans","sub_cat",550,"HMF",28,"black","lorem ipsum jeson",0),
ProductClass.new("DJ-jeans","jeans","sub_cat",550,"DJ",30,"blue","lorem ipsum jeson",1),
ProductClass.new("MRF-jeans","jeans","sub_cat",550,"MRF",32,"black","lorem ipsum jeson",0),
ProductClass.new("sneaker","shoes","sub_cat",100,"SNG",7,"lorem ipsum jeson",0),
ProductClass.new("sneaker26","shoes","sub_cat",150,"SNG",8,"lorem ipsum jeson",1),
ProductClass.new("meta-360","shoes","sub_cat",200,"meta",7,"lorem ipsum jeson",0),
ProductClass.new("puma-jeans","jeans","sub_cat",750,"lorem ipsum jeson",0)
]

categories = [
Category.new("jeans"),
Category.new("t-shirt"),
Category.new("shoes")
]

# Product.add_product(products)
# ProductClass.product_listening(products)

Category.product_search(categories,products)