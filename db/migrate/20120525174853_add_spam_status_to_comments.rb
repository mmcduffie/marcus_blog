class AddSpamStatusToComments < ActiveRecord::Migration
  def change
    add_column :comments, :spam_status, :boolean

  end
end
