class SubscriptionSerializer
  include JSONAPI::Serializer

  has_many :customer_subscription
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
end