class SessionsController < ApplicationController
  def new
    # Display the login form
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      # Sign the user in using Devise
      sign_in user
      flash[:notice] = "Logged in successfully"

      # Set a flash message to show the modal in the next request
      flash[:show_modal] = true

      # Do not manually redirect here, Devise will handle the redirect
      redirect_to after_sign_in_path_for(user)
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    sign_out current_user
    redirect_to root_path, notice: "Logged out successfully"
  end
end
