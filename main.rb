require_relative 'classes/product'
require_relative 'classes/user'
require_relative 'classes/category'
require_relative 'classes/cart'
require_relative 'classes/order'

orders = []
cart = []

def manage_cart(person,cart)
  lines = File.readlines("csv_files/cart.csv")
  lines.each do |line|
   if line.split(",")[4].to_i == person.user_id
    new_product =  Cart.new(line.chomp)
    puts new_product
    cart.push(new_product)
   end
  end
end



def user_dashboard(cart,orders,person)
  manage_cart(person,cart)
  while(1)
    puts "\nWelcome To Main Menu - "
    puts "\nSearch product: 1\nProduct Listings: 2\nshow cart: 3\norder checkout: 4\nLog Out: 5\nOrder History : 6\nPersonal Information : 7"
    print "\nEnter your choice : "
    user_choice = gets.chomp
    c=0
    case user_choice
      when "1"
        while(1)
          Category.product_search if count == 0 
          puts "Add to cart: 1\nBack to main menu: 0"
          puts "\nEnter your Choice : "
          input = gets.chomp
          case input
            when "1" 
              Cart.add_to_cart(cart,person)
              count+=1
            when "0" then break
            else
              count+=1
              puts "invalid input"
          end 
        end
       
      when "2" 
        while(1)
          ProductClass.product_listings if count == 0 
          puts "Add to cart: 1\nBack to main menu: 0"
          puts "\nEnter your Choice : "
          input = gets.chomp
          case input
            when "1" 
              Cart.add_to_cart(cart,person)
              count+=1
            when "0" then break
            else
              count+=1
              puts "invalid input"
          end 
        end
        
      when "3"
        while(1)
          person.show_cart(cart) if count == 0 
          puts "\nBack to main menu: 0"
          puts "\nEnter your Choice : "
          input = gets.chomp
          case input
            when "0" then break
            else
              count+=1
              puts "invalid input"
          end 
        end
        
      when "4"
        while(1)
          Cart.checkout(cart,orders) if count == 0 
          cart = []
          puts "\nBack to main menu: 0"
          puts "\nEnter your Choice : "
          input = gets.chomp
          case input
            when "0" then break
            else
              count+=1
              puts "invalid input"
          end 
        end
      when "5"
        print "you logged out"
        return
      when "6"
        while(1)
          Order.order_history(orders) if count == 0 
          puts "\nBack to main menu: 0"
          puts "\nEnter your Choice : "
          input = gets.chomp
          case input
            when "0" then break
            else
              count+=1
              puts "invalid input"
          end 
        end
      when "7"
        while(1)
          person.display_user if count == 0 
          puts "\nBack to main menu: 0"
          puts "\nEnter your Choice : "
          input = gets.chomp
          case input
            when "0" then break
            else
              count+=1
              puts "invalid input"
          end 
        end
      else
        cart = []
        orders = []
        count+=1
        puts "invalid request"
    end
    if c==4
      puts "logged out! because you crossed the limit of input\n"
      return
    end
  end
end

def admin_dashboard
  while(1)
    puts "\nAdd product : 1\nShow categories : 2\nShow users : 3\nshow products : 5\nDelete product : 6\nLog Out : 7\nAdd Category : 8\n "
    print "please enter your choice : "
    admin_choice = gets.chomp
    c=0
    case admin_choice
      when "1" 
        while(1)
          ProductClass.add_product if count == 0 
          puts "Add More product: 1\nBack to main menu: 0"
          puts "\nEnter your Choice : "
          input = gets.chomp
          case input
            when "1" 
              ProductClass.add_product
              count+=1
            when "0" then break
            else
              count+=1
              puts "invalid input"
          end
        end
      when "2" 
        while(1)
          Category.display_categories if count == 0 
          puts "Back to main menu: 0"
          puts "\nEnter your Choice : "
          input = gets.chomp
          case input
            when "0" then break
            else
              count+=1
              puts "invalid input"
          end
        end
      when "3" 
        while(1)
          User.show_users if count == 0 
          puts "Back to main menu: 0"
          puts "\nEnter your Choice : "
          input = gets.chomp
          case input
            when "0" then break
            else
              count+=1
              puts "invalid input"
          end 
        end
      when "5"
        while(1)
          ProductClass.show_products if count == 0 
          puts "Back to main menu: 0"
          puts "\nEnter your Choice : "
          input = gets.chomp
          case input
            when "0" then break
            else
              count+=1
              puts "invalid input"
          end 
        end
      when "6"
        while(1)
          ProductClass.delete_product if count == 0 
          puts "Delete More product: 1\nBack to main menu: 0"
          input = gets.chomp
          case input
            when "1" 
              ProductClass.delete_product
              count+=1
            when "0" then break
            else
              count+=1
              puts "invalid input"
          end  
        end
      when "7"
 
        print "\nyou logged out\n"
        return
      when "8" 
        while(1)
          Category.add_category if count == 0 
          puts "Add More Category: 1\nBack to main menu: 0"
          input = gets.chomp
          case input
            when "1" 
              Category.add_category
              count+=1
            when "0" then break
            else
              count+=1
              puts "invalid input"
          end 
        end
      else
        puts "\ninvalid choice, please try again \n"
    end
  end
end


while(1)
  puts "\nWelcome to e-commerce website"
  puts "login your account: 1\nRegister New User: 2\nCreate new admin account: 3"
  print "\nEnter your choice : "
  choice = gets.chomp
  case choice
    when "1" 
      person = User.login
      if(person&.role=="user")
        puts "\nLogin successful!"
        user_dashboard(cart,orders,person)
      elsif(person&.role=="admin")
        admin_dashboard
      else
        puts "you can not login\n"
      end
    when "2" 
      person = User.register("user")
      if person!=0
        puts "\nRegistered Successful!"
        user_dashboard(cart,orders,person) 
      else
        puts "\n User Not registered!"
      end
    when "3" 
      key = "xyz"
      c=0
      while(1)
        print "Enter password to create Admin: "
        input_key = gets.chomp
        if input_key!=key
          count+=1
          if c==3
            puts "max attempt limit exceeded try again letter - "
            break
          end
          print "incorrect password try again - " 
        else
        output = User.register("admin")
        puts "Admin Registered Successfully!" if output != 0
        break 
        end
      end
    else 
      puts "invalid choice, please try again \n"
  end
end
