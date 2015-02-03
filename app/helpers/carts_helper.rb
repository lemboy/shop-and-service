module CartsHelper
  
  def cart_count?
    Cart.count
  end 
  
end
