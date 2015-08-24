class RenameDescriptionToCaptionOnPins < ActiveRecord::Migration
  def up
    rename_column :pins, :description, :caption
  end

  def down
    rename_column :pins, :caption, :description
  end
end
