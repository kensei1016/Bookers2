class RenameFromSupriseToSurprise < ActiveRecord::Migration[5.2]
  def change
    rename_column :emotions, :suprise, :surprise
  end
end
