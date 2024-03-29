require 'rails_helper' 

RSpec.describe Subscription do 
  describe "validations" do 
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :status }
    it { should validate_presence_of :frequency }
  end

  describe "associations" do 
    it { should have_many(:customer_subscription) }
    it { should have_many(:subscription_teas) }
    it { should have_many(:teas).through(:subscription_teas)}
  end
end 