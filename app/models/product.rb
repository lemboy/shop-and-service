class Product < ActiveRecord::Base

  has_many :carts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :purchase_price, numericality: { :greater_than_or_equal_to => 0 }, :allow_nil => true
  validates :cash_price, numericality: { :greater_than_or_equal_to => 0 }, :allow_nil => true
  validates :noncash_price, numericality: { :greater_than_or_equal_to => 0 }, :allow_nil => true
  
  before_destroy :check_for_relations
  
  def in_cart?
    Cart.find_by(product_id: id)
  end

  def to_cart!
    if !Cart.exists?(product_id: id)
      Cart.create!(product_id: id)
    else
      prod_cnt = Cart.find_by_product_id(id).product_count
      Cart.find_by_product_id(id).update(product_count: prod_cnt + 1)
    end
  end
  
  def from_cart!
    if Cart.exists?(product_id: id)
      prod_cnt = Cart.find_by_product_id(id).product_count 
      if prod_cnt == 1
        Cart.find_by(product_id: id).destroy!
      else
        Cart.find_by_product_id(id).update(product_count: prod_cnt - 1)
      end
    end  
  end  

  private
  
    def check_for_relations
      if Product.exists?(group_id: id)
        errors.add :base, "Cannot delete (have relations)!" 
        return false
      end
    end
  
end
