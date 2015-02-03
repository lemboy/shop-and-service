class AddDefaultValueOnIsleafToProduct < ActiveRecord::Migration
  def change
    change_column :products, :is_leaf, :boolean, :default => true
  end
end
