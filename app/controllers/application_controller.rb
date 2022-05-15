class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_message

  private 

  def not_found_message(message) 
    render json: MessageSerializer.hashed_error_message(message.to_s), status: 400
  end 
end
