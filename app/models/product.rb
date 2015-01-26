class Product < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :purchase_price, numericality: { :greater_than_or_equal_to => 0 }, :allow_nil => true
  validates :cash_price, numericality: { :greater_than_or_equal_to => 0 }, :allow_nil => true
  validates :noncash_price, numericality: { :greater_than_or_equal_to => 0 }, :allow_nil => true
  
  before_destroy :check_for_relations
  
  def check_for_relations
    unless Product.exists?(group_id: id) 
      return false
    end
  end
  
end
