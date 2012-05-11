class AddUserIpToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_ip, :string

  end
end
