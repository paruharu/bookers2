class BooksController < ApplicationController
    
  def new
   @book = Book.new 
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # user.idのカラムを手動で入力
    book.user_id = current_user.id
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
    redirect_to book_path(book.id)
  end

  def index
    @books = Book.all
    @users = User.all
    @user = current_user
    
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
#   def edit end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body )
  end
  
end
