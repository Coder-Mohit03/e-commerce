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
          name,email,gender,pass,role = line.chomp.split(",")
          if email == input_email && pass.to_s == input_pass
            return User.new(name,email,gender,pass,role)
          end
        end
        if count==3
          return puts "max attempt limit exceeded try again letter - " 
        end
        puts "wrong password try again you have only #{3-c} attempts."
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
end