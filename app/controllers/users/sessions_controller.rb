# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private
  def respond_with(resource, _opts = {})
    render json: {
      message: 'You are logged in',
      data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
    }, status: :ok

    def responds_to_on_destroy
      logout_success && return if current_user

      log_out_failure
    end

    def logout_success
      render json: { message: 'You are logged out'}, status: :ok
    end

    def log_out_failure
      render json: { message: 'Logout failed'}, status: :unauthorized
    end
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
