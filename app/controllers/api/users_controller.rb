class Api::UsersController < ApplicationController
  before_action :authenticate_user!

  def reset_password
    authorize! :update, User
    if user_params.permitted? && current_user.valid_password?(params[:user][:old_password])
      if current_user.reset_password(params[:user][:new_password], params[:user][:new_password_confirmation])
        render json: { status: true  }
      else
        render_errors current_user
      end
    else
      render_errors current_user
    end
  end

  private

  def user_params
    params.required(:user).permit(
      :old_password,
      :new_password,
      :new_password_confirmation,
    )
  end

end
