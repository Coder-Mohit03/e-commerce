# $LOAD_PATH << '.'
require_relative '../modules/user_module'
class User
  attr_accessor :name,:email,:gender,:pass, :status,:role
  extend UserMod
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


end


# User.register(users)
# User.login(users)
# p users