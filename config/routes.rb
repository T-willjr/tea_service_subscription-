Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do  
      patch "/cancel", to: "customer_subscription#update"
      resources :subscribe, only: [:create], controller: :customer_subscription
    end 
  end 
end
