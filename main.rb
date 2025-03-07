require_relative 'classes/Product'
require_relative 'classes/User'
require_relative 'classes/Category'

products =[
ProductClass.new("yk_t-shirt","t-shirt","sub_cat",400,"yk","m","red","lorem ipsum jeson",1,4),
ProductClass.new("yk_t-shirt_new","t-shirt","sub_cat",450,"yk","m","red","lorem ipsum jeson",1,2),
ProductClass.new("jm_t-shirt","t-shirt","sub_cat",400,"jm","s","black","lorem ipsum jeson",1,3),
ProductClass.new("jm_t-shirt20","t-shirt","sub_cat",400,"jm","l","white","lorem ipsum jeson",1,4),
ProductClass.new("HMF-jeans","jeans","sub_cat",550,"HMF","28","black","lorem ipsum jeson",0,2),
ProductClass.new("DJ-jeans","jeans","sub_cat",550,"DJ","30","blue","lorem ipsum jeson",1,10),
ProductClass.new("MRF-jeans","jeans","sub_cat",550,"MRF","32","black","lorem ipsum jeson",0,5),
ProductClass.new("sneaker","shoes","sub_cat",100,"SNG","7","purple","lorem ipsum jeson",0,4),
ProductClass.new("sneaker26","shoes","sub_cat",150,"SNG","8","white","lorem ipsum jeson",1,3),
ProductClass.new("meta-360","shoes","sub_cat",200,"meta","7","black","lorem ipsum jeson",0,2),
ProductClass.new("puma-jeans","jeans","sub_cat",750,"puma","8","blue","lorem ipsum jeson",0,4)
]


categories = [
Category.new("jeans"),
Category.new("t-shirt"),
Category.new("shoes")
]

users = [
User.new("mohit","mohit@gmail.com","M","pass1",1),
User.new("admin","admin@gmail.com","M","admin1",1,"admin")          
]


while(1)
  puts "Welcome to e-commerce website"
  puts "Already have an account press 1 to login \n Press 2 to register"
  choice = gets.chomp
  case choice
    when "1" 
      active = User.login(users)
      if(active==1)
        while(1)
          puts "Search product : 1, Product Listenings : 2, Filter Products : 3, Order product : 4"
          user_choice = gets.chomp
          case user_choice
            when "1" then Category.product_search(categories,products) 
            when "2" then Product.product_listening(products)
            when "3" then Category.product_filter(categories,products)
          end
        end
      else
        puts "you can not login"
      end
    when "2" then User.register(users)
    else 
      puts "default"
  end
end

# Category.product_filter(categories,products)
# User.register(users)

