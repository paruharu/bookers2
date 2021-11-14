class UsersController < ApplicationController
  
  # before_action :login_check, {only: [:edit]}
  # before_action :ensure_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  
  def index
    @user = User.find(params[:id])
    @users = User.all
    # @user = current_user
  end
  
  def edit
    @user = User.find(params[:id])
      unless @user == current_user
      redirect_to  user_path
      end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:profile_image, :introduction, :name)
  end
  
end
