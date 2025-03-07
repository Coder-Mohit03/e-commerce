# $LOAD_PATH << '.'
require_relative '../modules/Category_module'


class Category
  attr_accessor :category_name
  extend CategoryMod
  def initialize(category_name)
    @category_name = category_name.downcase
  end
  
  def display_categories(categories)
    categories.each_with_index do |category,i|
      puts "#{i+1} = #{category}"
    end
  end

end
