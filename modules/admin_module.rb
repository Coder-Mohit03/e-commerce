module Admin
  def self.admin_dashboard
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