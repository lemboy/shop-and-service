class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :print_name
      t.string :contact_person
      t.string :contact_phone
      t.integer :lft
      t.integer :rgt
      t.boolean :is_leaf, :default => true
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
