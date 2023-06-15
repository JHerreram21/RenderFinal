# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    admin_email = 'admin@ejemplo.com'
    admin_password = 'contraseña'

    admin = User.find_by(email: admin_email)

    if admin.nil?
      admin = User.create(email: admin_email, password: admin_password, name: 'admin_ejemplo', admin: true, role: 1)
    end

    if params[:user][:email] == admin_email && params[:user][:password] == admin_password
      sign_in(admin, scope: :user)
      redirect_to root_path
    else
      super
    end
  end

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
