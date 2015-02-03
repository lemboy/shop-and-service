require 'rails_helper'

describe "Cart" do

  let(:product) { FactoryGirl.create(:product) }
  before { @cart = product.carts.build(product_count: 1) }

  subject { @cart }

  it { should respond_to(:product_count) }
  it { should respond_to(:product_id) }
  it { should respond_to(:product) }
  its(:product) { should eq product }

  it { should be_valid }

  describe "when product_id is not present" do
    before { @cart.product_id = nil }
    it { should_not be_valid }
  end
  
  describe "with count is less than 1" do
    before { @cart.product_count = 0 }
    it { should_not be_valid }
  end

  describe "with count is nil" do
    before { @cart.product_count = nil }
    it { should_not be_valid }
  end
  
end