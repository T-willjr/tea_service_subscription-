Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do  
      patch "/cancel", to: "customer_subscriptions#update"
      post "/subscriptions", to: "customer_subscriptions#index"
      resources :subscribe, only: [:create], controller: :customer_subscriptions
    end 
  end 
end
