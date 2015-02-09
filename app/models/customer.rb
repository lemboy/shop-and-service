class Customer < ActiveRecord::Base
  
  validates :name, presence: true, length: { maximum: 50 }
    
  before_destroy :check_for_relations

  private
  
    def check_for_relations
      if Customer.exists?(group_id: id)
        errors.add :base, "Cannot delete (have relations)!" 
        return false
      end
    end

end
