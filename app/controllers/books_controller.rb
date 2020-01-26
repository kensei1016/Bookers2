class BooksController < ApplicationController
  def new
  end

  def create
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: 'You have creatad book successfully.'
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @q = Book.all.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @books = @q.result

    @user = User.find(current_user.id)
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
    @post_comment = PostComment.new
    @post_comments = @book.post_comments.order(created_at: :desc)
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :book_image)
  end
end
