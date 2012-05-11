class RemoveStringFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :string
      end

  def down
    add_column :comments, :string, :string
  end
end
