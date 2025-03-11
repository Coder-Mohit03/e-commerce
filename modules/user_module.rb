module UserMod
  def register(role)
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
      end
      # user_found = users.find {|user| user.email == email}
      break if(input_email.match?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i) && a==true)
      print "#{a==true ? 'Invalid email, please try again - ':'sorry email already registered, try again - '}\n"
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

    user = User.new(name,email,gender,pass,role)

    aFile = File.open("users.csv", 'a+')

    if aFile
      values = user.write_in_file
      aFile.puts values
    end
  end

  def login()
    print "Enter email : "
    input_email = gets.chomp
    print "Enter password : "
    input_pass = gets.chomp
    lines = File.readlines("csv_files/users.csv")
    File.open("csv_files/users.csv","r") do |file|
      lines.each do |line|
        name,email,gender,pass,role = line.chomp.split(",")
        if email == input_email && pass.to_s == input_pass
          return role 
        end
      end
    end
  end 

  def manage_profile(user)
    user.display if user.role=="user"
    # puts "what do you want to update : "
  end

  def show_users
    puts "user's list"
    lines = File.readlines("csv_files/users.csv")
    File.open("csv_files/users.csv","r") do |file|
      lines.each do |line|
        name,email,gender,pass,role = line.chomp.split(",")
        puts "Name: #{name}, Email: #{email}, Gender: #{gender}"
      end
    end
  end

  

end