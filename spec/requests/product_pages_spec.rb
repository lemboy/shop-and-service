require 'rails_helper'

describe "Product pages" do

  subject { page }

  describe "index page" do
    let!(:product) { FactoryGirl.create(:product) }
    let!(:product_group) { FactoryGirl.create(:product_group) }
    let!(:product_in_group) { FactoryGirl.create(:product, group_id: product_group.id) }
    before { visit products_path }

    it { should have_content('Products list') }
    it { should have_title('Products list') }
    it { should have_content(product.name) }
    it { should have_content(product_group.name) }
    it { should_not have_content(product_in_group.name) }
  end
end
