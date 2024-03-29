class Tea < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description 
  validates_presence_of :temperature 
  validates_presence_of :brew_time
  
  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas
end
