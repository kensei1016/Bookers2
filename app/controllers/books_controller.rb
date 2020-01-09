class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book) # 投稿詳細画面
    else
      render edit_user_path(current_user.id)
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
