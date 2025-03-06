class User
  attr_accessor :name,:email,:gender,:pass, :status,:role
  def initialize(name,email,gender,pass,status=0,role="user")
    @name = name
    @email = email
    @gender = gender
    @pass = pass
    @status = status
    @role = role
  end
  
  def display()
    puts "Name = #{@name}, Email = #{@email}, Gender = #{@gender}"
  end

  def self.register(users)
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
      break if(email!='')
      print "Invalid email, please try again - "
    end

    while(1)
      print "Enter gender M(male)/F(female): "
      gender = gets.chomp
      break if(gender=="M" || gender=="F")
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
    # aFile = File.open("users.csv",'a+')
    # if aFile
    #   user.instance_variables.each do |i|
    #     puts i
    #     a = eval("#{user}.#{i}")
    #     puts a
    #     aFile.write(a)
    #   end
    # end
    # aFile.close
    users.push(user)
    puts "Login your account"
    login(users)
  end

  def self.login(users)
    print "Enter email : "
    email = gets.chomp
    print "Enter password : "
    pass = gets.chomp
    user = users.find {|e| e.email==email && e.pass == pass}
    puts "you logged in" if user
    # puts user
    user&.status = 1
  end 

  def manage_profile(user)
    user.display
    # puts "what do you want to update : "
  end

end

users = [User.new("mohit","mohit@gmail.com","M","pass1",1),
        User.new("admin","admin@gmail.com","M","admin1",1,"admin")          
]
# User.register(users)
User.login(users)
p users