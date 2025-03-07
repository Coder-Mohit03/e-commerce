$LOAD_PATH << '.'
require '../modules/Product_module'
class ProductClass
extend ProductMod
  attr_accessor :product_name,:cat,:sub_cat,:price,:description,:is_for_sale
  def initialize(product_name,cat,sub_cat,price,description,is_for_sale=0)
    @product_name = product_name
    @cat = cat
    @sub_cat = sub_cat
    @price = price.to_i
    @description = description
    @is_for_sale = is_for_sale
  end
end
products =[
ProductClass.new("T-shirt","category","sub_cat",400,"lorem ipsum jeson",1),
ProductClass.new("sneaker","category","sub_cat",450,"lorem ipsum jeson",1),
ProductClass.new("jeans","category","sub_cat",550,"lorem ipsum jeson",0)
]

# Product.add_product(products)
ProductClass.product_listening(products)

