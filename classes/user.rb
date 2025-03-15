# $LOAD_PATH << '.'
require_relative '../modules/user_module'
class User
  attr_accessor :name,:email,:gender,:pass, :status,:role,:user_id,:cart
  extend UserMod
  
  def initialize(name,email,gender,pass,role,user_id=false)
    lines = File.readlines("csv_files/users.csv")
    @@id = lines[-1].split(",")[5].to_i+1
    @name = name
    @email = email
    @gender = gender
    @pass = pass
    @role = role
    @user_id = user_id || @@id 
    @cart = []
  end
  
  def display_user
    puts "Name : #{name}\n,Email : #{email}\n,Gender : #{gender}\n "
  end

  def write_in_file
    "#{name},#{email},#{gender},#{pass},#{role},#{user_id}"
  end

  def show_cart
    puts "\nCart:"
    puts "Your Cart Is Empty -" if cart.length==0
    cart.each do |product|
      product.display_product
    end
  end
end


# User.register(users)
# User.login(users)
# p users