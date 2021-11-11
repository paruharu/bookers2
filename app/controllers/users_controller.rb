class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end
  
  def index
    @users = User.all
    @user = current_user
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:profile_image_id, :introduction, :name)
  end
  
end
