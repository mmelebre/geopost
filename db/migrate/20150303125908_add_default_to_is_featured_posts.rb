class AddDefaultToIsFeaturedPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :is_featured, :boolean, default: false

  end
end
