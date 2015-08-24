class SorceryCore < ActiveRecord::Migration
  def up
    rename_column :users, :encrypted_password, :crypted_password
    add_column :users, :salt, :string
  end

  def down
    rename_column :users, :crypted_password, :encrypted_password
    remove_column :users, :salt, :string
  end
end