require 'spec_helper'

describe "Customer" do

  before do
     @customer = Customer.new(name: "Customer name", print_name: "Print name for customer", 
                              contact_person: "Person name", contact_phone: "Phone number") 
  end

  subject { @customer }

  it { should respond_to(:name) }
  it { should respond_to(:print_name) }
  it { should respond_to(:contact_person) }
  it { should respond_to(:contact_phone) }
  
  it { should be_valid }

  describe "when name is not present" do
    before { @customer.name = " " }
    it { should_not be_valid }
  end

end
