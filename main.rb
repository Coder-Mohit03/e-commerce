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
# User.new("mohit","mohit@gmail.com","M","pass1"),
# User.new("admin","admin@gmail.com","M","admin1","admin")          
]
orders = []
cart = []

def user_dashboard(products,categories,users,cart)
  c=0
  while(1)
    puts "\nSearch product: 1\nProduct Listenings: 2\nFilter Products: 3\nadd to cart: 4\nshow cart: 5\norder checkout: 6\nLog Out: 7"
    print "\nEnter your choice : "
    user_choice = gets.chomp
    case user_choice
      when "1"
       Category.product_search(categories,products) 
      when "2" 
        ProductClass.product_on_sale(products)
      when "3" 
        Category.product_filter(categories,products)
      when "4"
        Cart.add_to_cart(products,users,cart)
      when "5"
        Cart.show_cart(cart)
      when "6"
        Cart.checkout(cart,orders,products)
      when "7"
        return
      else
        c+=1
        puts "invalid request"
    end
    if c==4
      puts "logged out! because you crossed the limit of input\n"
      return
    end
  end
end

def admin_dashboard(products,categories)
  c=0
  while(1)
    puts "\nAdd product : 1\nShow categories : 2\nShow users : 3\nupdate product : 4\nshow products : 5\nDelete product : 6\nLog Out : 7\n"
    print "please enter your choice : "
    admin_choice = gets.chomp
    case admin_choice
      when "1" then ProductClass.add_product(products)
      when "2" then Category.display_categories(categories)
      when "3" then User.show_users
      when "4" then ProductClass.edit_product_value(products)
      when "5" then ProductClass.show_products(products)
      when "6" then ProductClass.delete_product(products)
      else
        c+=1
        puts "\ninvalid choice, please try again \n"
    end
    if c==4
      puts "logged out! because you crossed the limit of input\n"
      return 
    end
  end
end


while(1)
  puts "Welcome to e-commerce website"
  puts "login your account: 1\nRegister New User: 2\nCreate new admin account: 3"
  print "\nEnter your choice : "
  choice = gets.chomp
  case choice
    when "1" 
      role = User.login
      if(role=="user")
        user_dashboard(products,categories,users,cart)
      elsif(role=="admin")
        admin_dashboard
      else
        puts "you can not login"
      end
    when "2" 
      User.register("user")
      user_dashboard(products,categories,users,cart)
    when "3" 
      key = "xyz"
      print "Enter password to create user: "
      input_key = gets.chomp
      if input_key!=key
        print "invalid password" 
      else
      User.register("admin") 
      end
    else 
      puts "invalid choice, please try again \n"
  end
end
