require 'rails_helper'

RSpec.describe "POST /subscriptions" do 
  it "displays customer subscriptions" do 
    tea = create(:tea)
    tea2 = create(:tea)
    customer = create(:customer)
    subscription = Subscription.create(title: "1 Tea Plan", 
                                        price: 10,
                                        frequency: "Weekly"   
                                      )
    subscription2 = Subscription.create(title: "2 Tea Plan", 
                                        price: 20,
                                        status: "Cancelled",
                                        frequency: "Weekly"   
                                      )
    subscription2 = Subscription.create(title: "2 Tea Plan", 
                                        price: 20,
                                        status: "Cancelled",
                                        frequency: "Weekly"   
                                      )

    SubscriptionTea.create(tea_id: tea.id, subscription_id: subscription.id)                       
    SubscriptionTea.create(tea_id: tea2.id, subscription_id: subscription2.id)         

    CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription.id)
    CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription2.id)

    cancel_params = { 
                      customer: customer.email 
                    }
                    
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/subscriptions", headers: headers, params: JSON.generate(cancel_params)

    response_body = JSON.parse(response.body, symbolize_names: true)

    expected_response_keys = [:type, :id, :attributes]
    expected_attribute_keys = [:id, :title, :price, :status, :frequency, :created_at, :updated_at]      
              
    expect(response).to have_http_status(200)
    expect(response_body).to be_a Hash 
    expect(response_body.count).to eq(1)
    expect(response_body[:data].keys).to eq(expected_response_keys)
    expect(response_body[:data][:type]).to eq("subscriptions")
    expect(response_body[:data][:attributes].first.keys).to eq(expected_attribute_keys)
  end 
end 