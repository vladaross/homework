module Api
  class BaseController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActionController::ParameterMissing, with: :bad_request
    before_action :authenticate

    private

    def bad_request
      render json: {
        error_message: "Something wrong!"
      }, status: :bad_request
    end
  end
end
