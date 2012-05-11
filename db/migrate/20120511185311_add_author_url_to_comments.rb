class AddAuthorUrlToComments < ActiveRecord::Migration
  def change
    add_column :comments, :author_url, :string

  end
end
