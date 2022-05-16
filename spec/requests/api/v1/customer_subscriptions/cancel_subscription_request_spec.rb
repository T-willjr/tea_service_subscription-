require 'rails_helper'

RSpec.describe "Cancel Subscription" do  
  describe "PATCH /cancel" do 
    it "cancels subscription" do 
      tea = create(:tea)
      tea2 = create(:tea)
      customer = create(:customer)
      subscription = Subscription.create(title: "1 Tea Plan", 
                                         price: 10,
                                         frequency: "Weekly"   
                                        )
      subscription2 = Subscription.create(title: "2 Tea Plan", 
                                         price: 20,
                                         frequency: "Weekly"   
                                        )

      SubscriptionTea.create(tea_id: tea.id, subscription_id: subscription.id)                       
      SubscriptionTea.create(tea_id: tea2.id, subscription_id: subscription2.id)         

      CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription.id)
      CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription2.id)

      cancel_params = { 
                        customer: customer.email, 
                        subscription_plan: subscription.title
                      }
                      
      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/cancel", headers: headers, params: JSON.generate(cancel_params)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expected_response_keys = [:type, :id, :attributes]

      expect(response).to have_http_status(200)
      expect(response_body).to be_a Hash 
      expect(response_body.count).to eq(1)
      expect(response_body[:data].keys).to eq(expected_response_keys)
      expect(response_body[:data][:type]).to eq("subscription")
      expect(response_body[:data][:attributes].keys).to eq([:message])
      expect(response_body[:data][:attributes][:message]).to eq("Your #{subscription.title} has been successfully cancelled.")
    end 
  end 
end 