class CreateEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :emotions do |t|
      t.boolean :happy, default: false
      t.boolean :cry, default: false
      t.boolean :suprise, default: false
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
