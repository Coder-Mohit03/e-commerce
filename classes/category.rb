# $LOAD_PATH << '.'
require_relative '../modules/category_module'


class Category
  attr_accessor :category_name
  extend CategoryMod
  def initialize(category_name)
    @category_name = category_name.downcase
  end
  
  def write_in_file
    "#{category_name}"
  end

end
