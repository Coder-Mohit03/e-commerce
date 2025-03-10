require_relative 'classes/product'
require_relative 'classes/user'
require_relative 'classes/category'
require_relative 'classes/cart'

products =[
ProductClass.new("yk_t-shirt","t-shirt",400,"yk","m","red","lorem ipsum jeson",1,4),
ProductClass.new("yk_t-shirt_new","t-shirt",450,"yk","m","red","lorem ipsum jeson",1,2),
ProductClass.new("jm_t-shirt","t-shirt",400,"jm","s","black","lorem ipsum jeson",1,3),
ProductClass.new("jm_t-shirt20","t-shirt",400,"jm","l","white","lorem ipsum jeson",1,4),
ProductClass.new("HMF-jeans","jeans",550,"HMF","28","black","lorem ipsum jeson",0,2),
ProductClass.new("DJ-jeans","jeans",550,"DJ","30","blue","lorem ipsum jeson",1,10),
ProductClass.new("MRF-jeans","jeans",550,"MRF","32","black","lorem ipsum jeson",0,5),
ProductClass.new("sneaker","shoes",100,"SNG","7","purple","lorem ipsum jeson",0,4),
ProductClass.new("sneaker26","shoes",150,"SNG","8","white","lorem ipsum jeson",1,3),
ProductClass.new("meta-360","shoes",200,"meta","7","black","lorem ipsum jeson",0,2),
ProductClass.new("puma-jeans","jeans",750,"puma","8","blue","lorem ipsum jeson",0,4)
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
orders = []
cart = []

def user_dashboard(products,categories,users,cart)
  print "\nWelcome to user dashboard - \n"
  while(1)
    puts "\n\nSearch product : 1, Product Listenings : 2, Filter Products : 3, add to cart : 4, show cart - 5, order checkout - 6 \n"
    user_choice = gets.chomp
    case user_choice
      when "1"
       Category.product_search(categories,products) 
      when "2" 
        ProductClass.product_listening(products)
      when "3" 
        Category.product_filter(categories,products)
      when "4"
        Cart.add_to_cart(products,users,cart)
      when "5"
        Cart.show_cart(cart)
      when
        Cart.checkout(cart,orders,products)
      else
        puts "default"
    end
  end
end

while(1)
  puts "Welcome to e-commerce website"
  puts "Already have an account press 1 to login \nor Press 2 to register\n"
  print "\nEnter your choice : "
  choice = gets.chomp
  case choice
    when "1" 
      role = User.login(users)
      if(role=="user")
        print "\nEnter your choice : "
        user_dashboard(products,categories,users,cart)
      elsif(role=="admin")
        while(1)
          puts "\nWelcome to admin dashboard - \n"
          puts "\nAdd product : 1, Show categories : 2, Show users : 3, update product : 4, show products : 5, Delete product : 6\n"
          print "please enter your choice : "
          admin_choice = gets.chomp
          case admin_choice
            when "1" then ProductClass.add_product(products)
            when "2" then Category.display_categories(categories)

            when "3" then User.show_users(users)

            when "4" then ProductClass.edit_product_value(products)
            when "5" then ProductClass.show_products(products)
            when "6" then ProductClass.delete_product(products)
            else
              puts "\ninvalid choice, please try again \n"
          end
        end
      else
        puts "you can not login"
      end
    when "2" 
      User.register(users)
      user_dashboard(products,categories,users,cart)
    else 
      puts "invalid choice, please try again \n"
  end
end
