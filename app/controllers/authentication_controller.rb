class AuthenticationController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def create
    user = User.find_by(email: params.require(:email))
    raise ExceptionHandler::AuthenticationError unless user.authenticate(params.require(:password))
    token = AuthenticationTokenService.call(user.id)

    render json: { token: token }, status: :created
  end

  private

  # def user
  #   @user ||= user.find_by(email: params.require(:email))
  # end

  def parameter_missing(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
