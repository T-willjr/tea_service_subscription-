require 'rails_helper'

RSpec.describe "Customer Subscriptions Request" do  
  describe "POST /subscribe" do 
    it "creates a customer tea subscription" do 
      tea = create(:tea)
      customer = create(:customer)
      subscription = Subscription.create(title: "1 Tea", 
                                         price: 10,
                                         frequency: "Weekly"   
                                        )

      subscription_params = { 
                              customer: customer.email, 
                              subscription: subscription.title, 
                              tea: tea.title, 
                            }
      
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/subscribe", headers: headers, params: JSON.generate(subscription_params)

      response_body = JSON.parse(response.body, symbolize_names: true)
      binding.pry
      expect(response).to have_http_status(200)
    end 
  end 
end 