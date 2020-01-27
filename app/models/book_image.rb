class BookImage < ApplicationRecord
  belongs_to :book
  attachment :book_image
end
