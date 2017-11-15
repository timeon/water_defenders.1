class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper

  def create
    super
  end

  def new
    super
  end

  def edit
    super
  end

  def user_params
    params.require(:user).permit(:name, :country, :state, :zip_code, :email, :password, :password_confirmation)
  end

end
