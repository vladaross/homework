module Api
  class BaseController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActionController::ParameterMissing, with: :bad_request
    before_action :authenticate

    private

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, _|
        User.find_by(token: token)
      end
    end

    def render_unauthorized
      render json: {
        error_message: 'Bad credentials'
      }, status: :unauthorized
    end

    def bad_request
      render json: {
        error_message: "Something wrong!"
      }, status: :bad_request
    end
  end
end
