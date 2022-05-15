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
      
      expected_response_keys = [:id, :customer_id, :subscription_id, :created_at, :updated_at]
      
      expect(response).to have_http_status(200)
      expect(response_body).to be_a Hash 
      expect(response_body.count).to eq(5)
      expect(response_body.keys).to eq(expected_response_keys)
    end 
  end 

  describe "POST /subscribe sad path" do 
    it "returns an error message if customer email does not exist" do 
      tea = create(:tea)
      customer = create(:customer)
      subscription = Subscription.create(title: "1 Tea", 
                                         price: 10,
                                         frequency: "Weekly"   
                                        )

      subscription_params = { 
                              customer: "emailisnotindatabase@gmail.com", 
                              subscription: subscription.title, 
                              tea: tea.title, 
                            }
      
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/subscribe", headers: headers, params: JSON.generate(subscription_params)

      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expected_response_keys = [:type, :id, :attributes]

      expect(response).to have_http_status(400)
      expect(response_body).to be_a Hash 
      expect(response_body.count).to eq(1)
      expect(response_body[:data].keys).to eq(expected_response_keys)
      expect(response_body[:data][:type]).to eq("error")
      expect(response_body[:data][:attributes].keys).to eq([:error])
      expect(response_body[:data][:attributes][:error][:message]).to eq("Couldn't find Customer")
    end 
    
    it "returns an error message if subscription type does not exist" do 
      tea = create(:tea)
      customer = create(:customer)
      subscription = Subscription.create(title: "3 Tea", 
                                         price: 10,
                                         frequency: "Weekly"   
                                        )

      subscription_params = { 
                              customer: customer.email, 
                              subscription: "50 Tea", 
                              tea: tea.title, 
                            }
      
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/subscribe", headers: headers, params: JSON.generate(subscription_params)

      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expected_response_keys = [:type, :id, :attributes]

      expect(response).to have_http_status(400)
      expect(response_body).to be_a Hash 
      expect(response_body.count).to eq(1)
      expect(response_body[:data].keys).to eq(expected_response_keys)
      expect(response_body[:data][:type]).to eq("error")
      expect(response_body[:data][:attributes].keys).to eq([:error])
      expect(response_body[:data][:attributes][:error][:message]).to eq("Couldn't find Subscription")
    end 

    it "returns an error message if tea type does not exist" do 
      tea = create(:tea)
      customer = create(:customer)
      subscription = Subscription.create(title: "3 Tea", 
                                         price: 10,
                                         frequency: "Weekly"   
                                        )

      subscription_params = { 
                              customer: customer.email, 
                              subscription: "3 Tea", 
                              tea: "Expresso", 
                            }
      
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/subscribe", headers: headers, params: JSON.generate(subscription_params)

      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expected_response_keys = [:type, :id, :attributes]

      expect(response).to have_http_status(400)
      expect(response_body).to be_a Hash 
      expect(response_body.count).to eq(1)
      expect(response_body[:data].keys).to eq(expected_response_keys)
      expect(response_body[:data][:type]).to eq("error")
      expect(response_body[:data][:attributes].keys).to eq([:error])
      expect(response_body[:data][:attributes][:error][:message]).to eq("Couldn't find Tea")
    end 
  end 
end 