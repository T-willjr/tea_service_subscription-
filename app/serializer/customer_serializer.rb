class CustomerSerializer
  include JSONAPI::Serializer

  has_one :customer_subscription
  has_one :subscription, through: :customer_subscription
  has_many :teas, through: :subscription
end