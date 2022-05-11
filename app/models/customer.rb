class Customer < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name 
  validates_presence_of :email
  validates_presence_of :address
  
  has_one :customer_subscription
  has_one :subscription, through: :customer_subscription
  has_many :teas, through: :subscription
end
