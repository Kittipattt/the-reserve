class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      sign_in user
      flash[:notice] = "Logged in successfully"

      flash[:show_modal] = true

      redirect_to after_sign_in_path_for(user)
    else
      flash.now[:alert] = "Invalid email or password"
      render :index
    end
  end

  def destroy
    sign_out current_user
    redirect_to root_path, notice: "Logged out successfully"
  end
end
