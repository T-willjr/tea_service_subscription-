class Subscription < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status
  validates_presence_of :frequency

  has_many :customer_subscription
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas

  enum status: { "Active" => 1, "Cancelled" => 2 }
  enum frequency: { "Weekly" => 1, "Bi-Weekly" => 2 }
end
