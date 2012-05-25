class AddSpamMessageToComments < ActiveRecord::Migration
  def change
    add_column :comments, :spam_message, :string

  end
end
