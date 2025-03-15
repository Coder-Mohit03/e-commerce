module UserMod
  def register(role_input)
    pass = 
    cp = 
    gender = 
    c = 0
    while(1)
      print "Enter User Name : "
      input_name = gets.chomp
      break if(input_name.length!=0 && input_name.match?(/[a-zA-Z ]/))
      print "Name field could not be empty or invalid , please try again - \n"
    end
    while(1)
      print "Enter Email address : "
      input_email = gets.chomp
      a = true
      lines = File.readlines("csv_files/users.csv")
      aFile = File.open("csv_files/users.csv","r+")
      if aFile
        lines.each do |line|
          name,email,gender,pass,role = line.chomp.split(",")
          if input_email==email
            a= false
          end
        end
        aFile.close
      end
      # user_found = users.find {|user| user.email == email}
      break if(input_email.match?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i) && a==true)
      print "#{a==true ? 'Invalid email, please try again - ':'sorry email already registered, try again - '}\n"
    end

    while(1)
      print "Enter gender M(male)/F(female): "
      gender = gets.chomp.downcase
      break if(gender=="m" || gender=="f")
      print "Invalid selection, please try again - \n"
    end
    flag = true
    while(1)
      while(flag) 
        print "Enter Password : "
        pass = gets.chomp
        break if(pass.length>=5)     
        puts "password length must be 5\n" 
      end
      print "Confirm Password : "
      cp = gets.chomp
      print "password and confirm password not matching try again - " if(pass!=cp)
      break if(pass==cp && pass!='' && cp!='')
      c+=1
      if c==3
        puts "\nmax attempt limit exceeded try again letter - "
        return 0
      end
      flag = false
    end

      user = User.new(input_name,input_email,gender,pass,role_input)

      aFile = File.open("csv_files/users.csv","a+")
      if aFile
        values = user.write_in_file
        aFile.puts values
      end
      aFile.close
    user
  end

  def login()
    lines = File.readlines("csv_files/users.csv")
    count = 0
    while(1)
      flag = false
      print "Enter email : "
      input_email = gets.chomp
      count+=1
      lines.each do |line|
        name,email =  line.chomp.split(",")
        flag = true if email == input_email 
      end
      if count==3
        return puts "max attempt limit exceeded try again letter - "
      elsif flag == true
        break
      end
      puts "email not registered! register yourself first" 
    end
    count=0
    while(1)
      print "Enter password : "
      input_pass = gets.chomp
      File.open("csv_files/users.csv","r") do |file|
        lines.each do |line|
          name,email,gender,pass,role,user_id = line.chomp.split(",")
          if email == input_email && pass.to_s == input_pass
            return User.new(name,email,gender,pass,role,user_id)
          end
        end
        if count==3
          return puts "max attempt limit exceeded try again letter - " 
        end
        puts "wrong password try again you have only #{3-count} attempts."
        count+=1
      end
    end
  end 

  def show_users
    puts "user's list"
    lines = File.readlines("csv_files/users.csv")
    File.open("csv_files/users.csv","r") do |file|
      lines.each do |line|
        name,email,gender,pass,role = line.chomp.split(",")
        puts "Name: #{name}, Email: #{email}, Gender: #{gender}" if role=="user"
      end
    end
  end

  def user_dashboard(orders,person)
    manage_cart(person)
    while(1)
      puts "\nWelcome To Main Menu - "
      puts "\nSearch product: 1\nProduct Listings: 2\nshow cart: 3\norder checkout: 4\nLog Out: 5\nOrder History : 6\nPersonal Information : 7"
      print "\nEnter your choice : "
      user_choice = gets.chomp
      count=0
      case user_choice
        when "1"
          while(1)
            Category.product_search if count == 0 
            puts "Add to cart: 1\nBack to main menu: 0"
            puts "\nEnter your Choice : "
            input = gets.chomp
            case input
              when "1" 
                Cart.add_to_cart(person)
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
                Cart.add_to_cart(person)
                count+=1
              when "0" then break
              else
                count+=1
                puts "invalid input"
            end 
          end
          
        when "3"
          while(1)
            person.show_cart if count == 0 
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
          cart = []
          orders = []
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
      if count==4
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
      count=0
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

end