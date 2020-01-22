class PostCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @post_comment = current_user.post_comments.new(comment_params)
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

  def edit
    # HTTPステータス(204:成功)をレスポンスボティ無しで明示的に送信（無くてもAjaxは動くらしい）
    head :no_content
  end

  def update
    post_comment = PostComment.find(params[:id])
    post_comment.update!(comment_params)
    head :no_content
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    
    redirect_to book_path(params[:book_id]), notice: "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:post_comment).permit(:user_id, :book_id, :comment)
  end
end
