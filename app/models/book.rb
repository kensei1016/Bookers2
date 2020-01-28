class Book < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :emotions, dependent: :destroy
  has_many :book_images, dependent: :destroy

  accepts_attachments_for :book_images, attachment: :book_image

  validates :title,
   presence: true

  validates :body,
   presence: true,
   length: {maximum: 200}

   def self.ransackable_attributes(auth_object = nil)
    %w[title body created_at]
   end

   def self.ransackable_associations(auth_object = nil)
    []
   end

   def emotion_count(emotion_type)
    return 0 unless emotions.has_attribute?(emotion_type)
    emotions.where(emotion_type => true).count
   end

   def emotion_by?(user, emotion_type)
    user_emotion = Emotion.find_by(user_id: user.id, book_id: id)
    # user_emotionが存在しなければfalse
    return false unless user_emotion.present?
    # emotion_typeが存在しなければfalse
    return false unless emotions.has_attribute?(emotion_type)

    # user_emotionのemotion_typeの状態を返す
    user_emotion[emotion_type]
   end
end
