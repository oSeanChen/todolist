# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[username])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[username])
    end

    def after_sign_up_path_for(_resource)
      categories_path
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
