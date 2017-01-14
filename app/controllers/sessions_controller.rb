class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: login_params[:email])
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to "/songs"
    else
      flash[:danger] = "Invalid please try again"
      redirect_to '/'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You are now logged out"
    redirect_to root_path
  end
  
  private
  
  def login_params
    params.require(:login).permit(:email, :password)
  end
end