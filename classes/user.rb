# $LOAD_PATH << '.'
require_relative '../modules/user_module'
class User
  attr_accessor :name,:email,:gender,:pass, :status,:role,:user_id
  extend UserMod
  
  def initialize(name,email,gender,pass,role)
    lines = File.readlines("csv_files/users.csv")
    @@id = lines[-1].split(",")[5].to_i+1
    @name = name
    @email = email
    @gender = gender
    @pass = pass
    @role = role
    @user_id = @@id
  end
  
  def display_user
    puts "Name : #{name}\n,Email : #{email}\n,Gender : #{gender}\n "
  end

  def write_in_file
    "#{name},#{email},#{gender},#{pass},#{role},#{user_id}"
  end
end


# User.register(users)
# User.login(users)
# p users