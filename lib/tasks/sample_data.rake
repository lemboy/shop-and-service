namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_products
  end
end

def make_products
  5.times do |n|
    name  = "Name example-#{n+1}"
    description = "Description example-#{n+1}"
    is_leaf = true
    Product.create!(name: name,
                    description: description,
                    is_leaf: is_leaf)
  end

  Product.create!(name: "Group 1", is_leaf: false)
  group_id = Product.last.id
  Product.create!(name: "Group 11", is_leaf: false, group_id: group_id)
  Product.create!(name: "Group 12", is_leaf: false, group_id: group_id)

  5.times do |n|
    name  = "Name example-g1-#{n+1}"
    description = "Description example-g1-#{n+1}"
    is_leaf = true
    Product.create!(name: name,
                    description: description,
                    is_leaf: is_leaf,
                    group_id: group_id)
  end

  Product.create!(name: "Group 13", is_leaf: false, group_id: group_id)
  group_id = Product.last.id
  
  5.times do |n|
    name  = "Name example-g13-#{n+1}"
    description = "Description example-g13-#{n+1}"
    is_leaf = true
    Product.create!(name: name,
                    description: description,
                    is_leaf: is_leaf,
                    group_id: group_id)
  end
  
end
