class PostCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @post_comment = current_user.post_comments.new(set_comment_params)
    @post_comment.book_id = @book.id
    if @post_comment.save
      redirect_to book_path(@book.id), notice: "コメントを投稿しました"
    else
      @book_new = Book.new
      @user = User.find(current_user.id)
      @post_comments = @book.post_comments

      render "books/show"
    end
  end

  def destroy
  end

  private

  def set_comment_params
    params.require(:post_comment).permit(:user_id, :book_id, :comment)
  end
end
