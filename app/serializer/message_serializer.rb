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
  end
end 