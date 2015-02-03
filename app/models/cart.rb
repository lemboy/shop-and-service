class Cart < ActiveRecord::Base

  belongs_to :product

  validates :product_id, presence: true
  validates :product_count, numericality: { :greater_than_or_equal_to => 1 }, :allow_nil => false
 
end
