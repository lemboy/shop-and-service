require 'spec_helper'

describe "Product" do

  before do
     @product = Product.new(name: "Example name", description: "Example description", measure: "pcs", 
                            is_service: false, purchase_price: 10.00, cash_price: 12.00, noncash_price: 15.00) 
  end

  subject { @product }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:measure) }
  it { should respond_to(:is_service) }
  it { should respond_to(:purchase_price) }
  it { should respond_to(:cash_price) }
  it { should respond_to(:noncash_price) }
  
  it { should be_valid }

  describe "when name is not present" do
    before { @product.name = " " }
    it { should_not be_valid }
  end

  describe "when price is empty" do
    before { @product.purchase_price = "" }
    it { should be_valid }
  end

  describe "when price is nil" do
    before { @product.purchase_price = nil }
    it { should be_valid }
  end

  describe "when price is negative" do
    before { @product.purchase_price = -10 }
    it { should_not be_valid }
  end
end
