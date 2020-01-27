class EmotionsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    emotion_type = params[:emotion_type]
    # 本に対して自分のEmotionがすでにあれば、Update
    # なければ,新規で作成する。
    current_user_emotion = book.emotions.find_by(user_id: current_user.id)
    if current_user_emotion.nil?
      # 本に対してユーザのEmotionがない場合
      emotion = current_user.emotions.new(book_id: book.id)
      emotion[emotion_type] = true
      emotion.save!
      redirect_to book_path(book)
    else
      # 本に対してすでにEmotionがある場合
      current_user_emotion[emotion_type] = true
      current_user_emotion.save!
      redirect_to book_path(book)
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    current_user_emotion = book.emotions.find_by(user_id: current_user.id)
    emotion_type = params[:emotion_type]
    # current_user_emotion.destroy!
    current_user_emotion[emotion_type] = false
    current_user_emotion.save!
    redirect_to book_path(book)
  end
end
