class BooksController < ApplicationController
  
  # before_action :login_check, {only: [:edit]}
    
  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # user.idのカラムを手動で入力
    @book.user_id = current_user.id
    # ２. データをデータベースに保存するためのsaveメソッド実行

    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @users = User.all
    @user = current_user
    @book = Book.new

  end

  def show
    @books = Book.all
    @booka = Book.find(params[:id])
    @user = @booka.user
    @book = Book.new
  end
  
#   def edit end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def edit
    @book = Book.find(params[:id])
      unless @book.user == current_user
      redirect_to  book_path
      end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body )
  end
  
end
