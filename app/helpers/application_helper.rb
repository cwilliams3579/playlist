module ApplicationHelper
  def show
    @users = User.all
    @user = User.find(params[:user_id])
  end
end
