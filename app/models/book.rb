class Book < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy

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
end
