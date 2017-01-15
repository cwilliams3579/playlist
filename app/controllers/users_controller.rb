class UsersController < ApplicationController
  expose :users, ->{ User.all }
  expose :user
  def index
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome to the song hub #{user.full_name}"
      redirect_to '/songs'
    else
      redirect_to '/', alert: user.errors.full_messages
    end
  end

  def edit
  end

  def update
    if user.update(user_params)
      flash[:notice] = "Your profile was successfully updated"
      redirect_to songs_path
    else
      render 'edit'
    end
  end

  def login
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/songs'
      else
        redirect_to '/', alert: ['Invalid password']
      end
    else
      redirect_to '/', alert: ['Email not found']
    end
  end

  def show
    # user = User.find(params[:id])
    # songs = Song.all
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:danger] = "User and all songs have been deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
