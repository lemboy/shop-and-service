require 'rails_helper'

describe "Customer pages" do

  subject { page }

  describe "index page" do
    let!(:customer) { FactoryGirl.create(:customer) }
    let!(:customer_group) { FactoryGirl.create(:customer_group) }
    let!(:customer_in_group) { FactoryGirl.create(:customer, group_id: customer_group.id) }

    describe "root path" do
      before { visit customers_path }

      it { should have_content('Customers list') }
      it { should have_title('Customers list') }
      it { should have_content(customer.name) }
      it { should have_content(customer_group.name) }
      it { should_not have_content(customer_in_group.name) }    
    end

    describe "subgroup path" do
      before { visit customers_path+"?grp_id=#{customer_group.id}" }

      it { should have_content(customer_group.name) }
      it { should have_content(customer_in_group.name) }    
    end
  end #describe "index page"
  
  describe "profile page" do
    let(:customer) { FactoryGirl.create(:customer) }
    before { visit customer_path(customer) }

    it { should have_title(customer.name) }
    it { should have_content(customer.name) }
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
      let(:new_name)  { "New customer Name" }
      it { should have_content(new_name) }
      it { should have_selector('div.alert.alert-success') }
    end
  end

  describe "edit" do
    let(:customer) { FactoryGirl.create(:customer) }
    let(:customer_group) { FactoryGirl.create(:customer_group) }
    before { visit edit_customer_path(customer) }

    describe "item" do
      it { should have_title(customer.name) }
      it { should have_content(customer.name) }
    end

    describe "group" do
      before { visit edit_customer_path(customer_group) }
      it { should_not have_content('price') }
    end

    describe "with_shared" do
      it_should_behave_like "shared_with"
    end
  end #describe "edit"

  describe "add" do
    before { visit customers_path }

    describe "item" do
      before { click_link "Add item" }
      it { should have_title("New customer") }
      it { should have_content("New customer") }
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
