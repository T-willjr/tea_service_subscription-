class MessageSerializer
  class << self 
    def hashed_error_message(error_message)
      {
        "data": {
          "type": "error",
          "id": nil,
          "attributes": {
            "error": {
              "message": error_message
            }
          }
        }
      }
    end 

    def hashed_subscription_cancelled(subscription_plan)
      {
        "data": {
          "type": "subscription",
          "id": nil,
          "attributes": {
            "message": "Your #{subscription_plan} has been successfully cancelled."
          }
        }
      }
    end 
  end
end 