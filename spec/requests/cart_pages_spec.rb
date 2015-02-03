require 'rails_helper'

describe "Cart" do

  subject { page }

  describe "index page" do
    before do
      visit carts_path
    end

    it { should have_content('Carts') }
    it { should have_title('Carts') }

  end #describe "index page"

  describe "show page" do
    let!(:product) { FactoryGirl.create(:product) }
    let!(:cart) { FactoryGirl.create(:cart, product: product) } 

    before do
      visit cart_path(cart) 
    end

    it { should have_content('Cart') }
    it { should have_title('Cart') }
    it { should have_content(product.name) }
    it { should have_content(cart.product_count) }

  end #describe "show page"

end
