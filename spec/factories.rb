FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Test Product #{n}" }
    is_leaf true
    
    factory :product_group do
      sequence(:name) { |n| "Test Group #{n}" }
      is_leaf false
    end
  end
  
  factory :cart do
    product_count = 11
    product
  end

  factory :customer do
    sequence(:name) { |n| "Test Customer #{n}" }
    is_leaf true
    
    factory :customer_group do
      sequence(:name) { |n| "Test Group #{n}" }
      is_leaf false
    end
  end
end