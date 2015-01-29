require 'rails_helper'

describe "Product pages" do

  subject { page }

  describe "index page" do
    let!(:product) { FactoryGirl.create(:product) }
    let!(:product_group) { FactoryGirl.create(:product_group) }
    let!(:product_in_group) { FactoryGirl.create(:product, group_id: product_group.id) }

    describe "root path" do
      before { visit products_path }

      it { should have_content('Products list') }
      it { should have_title('Products list') }
      it { should have_content(product.name) }
      it { should have_content(product_group.name) }
      it { should_not have_content(product_in_group.name) }    
    end

    describe "subgroup path" do
      before { visit products_path+"?grp_id=#{product_group.id}" }

      it { should have_content(product_group.name) }
      it { should have_content(product_in_group.name) }    
    end
  end #describe "index page"
  
  describe "profile page" do
    let(:product) { FactoryGirl.create(:product) }
    before { visit product_path(product) }

    it { should have_title(product.name) }
    it { should have_content(product.name) }
  end #describe "profile page"

  shared_examples_for "shared_with" do
    before do
      fill_in "Name", with: new_name
      click_button "Update"
    end

    describe "invalid information" do
      let(:new_name)  { "" }
      it { should have_content('error') }
    end

    describe "valid information" do
      let(:new_name)  { "New Product Name" }
      it { should have_content(new_name) }
      it { should have_selector('div.alert.alert-success') }
    end
  end

  describe "edit" do
    let(:product) { FactoryGirl.create(:product) }
    let(:product_group) { FactoryGirl.create(:product_group) }
    before { visit edit_product_path(product) }

    describe "item" do
      it { should have_title(product.name) }
      it { should have_content(product.name) }
    end

    describe "group" do
      before { visit edit_product_path(product_group) }
      it { should_not have_content('price') }
    end

    describe "with_shared" do
      it_should_behave_like "shared_with"
    end
  end #describe "edit"

  describe "add" do
    before { visit products_path }

    describe "item" do
      before { click_link "Add item" }
      it { should have_title("New product") }
      it { should have_content("New product") }
    end

    describe "group" do
      before { click_link "Add group" }
      it { should_not have_content('price') }
    end

    describe "with" do
      before { click_link "Add item" }
      it_should_behave_like "shared_with"
    end
  end #describe "add"

end
