require_relative 'classes/product'
require_relative 'classes/user'
require_relative 'classes/category'
require_relative 'classes/cart'
require_relative 'classes/order'
require_relative 'modules/admin_module'


while(1)
  puts "\nWelcome to e-commerce website"
  puts "login your account: 1\nRegister New User: 2\nCreate new admin account: 3"
  print "\nEnter your choice : "
  choice = gets.chomp
  case choice
    when "1" 
      person = User.login
      puts person
      if(person&.role=="user")
        puts "\nLogin successful!"
        User.user_dashboard(person)
      elsif(person&.role=="admin")
        Admin.admin_dashboard
      else
        puts "you can not login\n"
      end
    when "2" 
      person = User.register("user")
      if person!=0
        puts "\nRegistered Successful!"
        User.user_dashboard(person) 
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
