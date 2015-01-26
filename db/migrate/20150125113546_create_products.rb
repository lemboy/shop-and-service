class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.text    :description
      t.string  :measure
      t.boolean :is_service, :default => false
      t.decimal :purchase_price, :precision => 16, :scale => 2, :default => 0.00
      t.decimal :cash_price, :precision => 16, :scale => 2, :default => 0.00
      t.decimal :noncash_price, :precision => 16, :scale => 2, :default => 0.00
      t.integer :lft
      t.integer :rgt
      t.boolean :is_leaf

      t.timestamps null: false
    end
  end
end
