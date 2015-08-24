class AddStatusToPins < ActiveRecord::Migration
  def change
    add_column :pins, :status, :integer, default: 1
  end
end
