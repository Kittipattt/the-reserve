class RegistrationsController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # Encrypt password (if using Devise helpers)
    @user.password = params[:user][:password]
    
    if @user.save
      flash[:notice] = "User registered successfully!"
      redirect_to login_path
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
  end
end