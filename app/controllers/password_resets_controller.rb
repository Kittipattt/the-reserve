class PasswordResetsController < ApplicationController
  before_action :find_user_by_token, only: [:edit, :update]
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user
      @user.generate_password_reset_token!

      UserMailer.password_reset(@user).deliver_now

      flash[:notice] = "Password reset instructions sent to your email."
      redirect_to root_path
    else
      flash.now[:alert] = "Email address not found."
      render :new
    end
  end

  def edit
    if @user.nil?
      flash[:alert] = "Invalid or expired token."
      redirect_to new_password_reset_path
    end
  end

  def update
    if @user.update(password_params)
      @user.update(reset_password_token: nil) 
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

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
