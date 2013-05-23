class RenameTitleInPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :Title, :title
  end
end
