class PasswordResetsController < ApplicationController
  before_action :find_user_by_token, only: [:edit, :update]

  # Show the password reset request form
  def new
    # You can leave this empty if no additional logic is needed
  end

  # Handle password reset request (send email with token)
  def create
    @user = User.find_by(email: params[:email])

    if @user
      # Generate the reset token and save it in the user model
      @user.generate_password_reset_token!  # This must be defined in the User model

      # Send the reset email
      UserMailer.password_reset(@user).deliver_now

      flash[:notice] = "Password reset instructions sent to your email."
      redirect_to root_path
    else
      flash.now[:alert] = "Email address not found."
      render :new
    end
  end

  # Show the form to reset the password (after clicking the link in the email)
  def edit
    if @user.nil?
      flash[:alert] = "Invalid or expired token."
      redirect_to new_password_reset_path
    end
  end

  # Handle the form submission to update the password
  def update
    if @user.update(password_params)
      @user.update(reset_password_token: nil) # Reset the token after successful password change
      flash[:notice] = "Password successfully reset."
      redirect_to login_path
    else
      flash.now[:alert] = "There was an error resetting your password."
      render :edit
    end
  end
  

  private

  def find_user_by_token
    @user = User.find_by(reset_password_token: params[:token])
  end

  # Strong parameters for password update
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
