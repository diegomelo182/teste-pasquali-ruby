module V1
  class AuthController < ApplicationController
    include AuthHandler

    skip_before_action :jwt_auth_validation, only: [:login]

    def login
      response = check_auth(auth_params)
      response_body = response[:data]
      if !response[:data][:error]
        jwt_token = jwt_encode(response[:data])
        response_body = { token: jwt_token }
      end

      render json: response_body, status: response[:status]
    end

    private
      def auth_params
        params.require(:auth).permit(:user, :password)
      end
  end
end
