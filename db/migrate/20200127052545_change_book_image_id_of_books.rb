class ChangeBookImageIdOfBooks < ActiveRecord::Migration[5.2]
  def up
    change_column :books, :book_image_id, :integer
  end

  def down
    change_column :books, :book_image_id, :string
  end
end
