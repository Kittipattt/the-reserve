class SessionsController < ApplicationController
  def new
    # Display the login form
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      # Sign the user in
      sign_in user
      flash[:notice] = "Logged in successfully"

      # Set a header or add a flash class to trigger modal in the view
      flash[:show_modal] = true

      redirect_to dashboard_path
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
