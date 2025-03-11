# $LOAD_PATH << '.'
require_relative '../modules/user_module'
class User
  attr_accessor :name,:email,:gender,:pass, :status,:role
  extend UserMod
  def initialize(name,email,gender,pass,role="user")
    @name = name
    @email = email
    @gender = gender
    @pass = pass
    @role = role
  end
  
  def display()
    puts "Name = #{@name}, Email = #{@email}, Gender = #{@gender}"
  end

  def write_in_file
    "#{name},#{email},#{gender},#{pass},#{role}"
  end
end


# User.register(users)
# User.login(users)
# p users