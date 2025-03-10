module UserMod
  def register(users)
    pass = 
    cp = 
    gender = 
    while(1)
      print "Enter User Name : "
      name = gets.chomp
      break if(name.length!=0)
      print "Invalid name, please try again - "
    end
    while(1)
      print "Enter Email address : "
      email = gets.chomp
      user_found = users.find {|user| user.email == email}
      break if(email.match?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i) && user_found.nil?)
      print "#{user_found.nil? ? 'Invalid email, please try again - ':'sorry email already registered, try again - '}\n"
    end

    while(1)
      print "Enter gender M(male)/F(female): "
      gender = gets.chomp.downcase
      break if(gender=="m" || gender=="f")
      print "Invalid selection, please try again - "
    end

    while(1)
      while(1)
        print "Enter Password : "
        pass = gets.chomp
        break if(pass.length>=5)     
        puts "password length must be 5" 
      end
      print "Confirm Password : "
      cp = gets.chomp
      print "password and confirm password not matching try again - " if(pass!=cp)
      break if(pass==cp && pass!='' && cp!='')
    end

    user = User.new(name,email,gender,pass)

  #   aFile = File.open("users.csv", 'a+')

  #   if aFile
  #     user.instance_variables.each do |var|
  #       value = user.instance_variable_get(var)
  #       aFile.write("#{value},")
  #     end  
  #     aFile.puts
  #   end
  #   aFile.close
    users.push(user)
  end

  def login(users)
    print "Enter email : "
    email = gets.chomp
    print "Enter password : "
    pass = gets.chomp
    user = users.find {|e| e.email==email && e.pass == pass}
    user&.status = 1
    user&.role 
  end 

  def manage_profile(user)
    user.display if user.role=="user"
    # puts "what do you want to update : "
  end

  def show_users(users)
    puts "user's list"
    users.each do |user|
      user.display if user.role != "admin"
    end
  end

end