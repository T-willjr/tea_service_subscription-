class Api::V1::CustomerSubscriptionController < ApplicationController 
  def create 
    customer = Customer.find_by(email: params[:customer])
    subscription = Subscription.find_by(title: params[:subscription])
    tea = Tea.find_by(title: params[:tea])

    if customer.present?
      SubscriptionTea.create(subscription_id: subscription.id, tea_id: tea.id)
      render json: CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription.id)
    else 
      render json: MessageSerializer.hashed_error
    end 
  end 
end 