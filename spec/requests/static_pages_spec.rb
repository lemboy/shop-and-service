require 'rails_helper'

describe "Static pages" do
  
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
    
    it { should have_title('Shop and Service') }
  end
end
