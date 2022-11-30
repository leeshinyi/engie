class ApplicationController < ActionController::API
  def health_check
    render json: { success: true }
  end
end
