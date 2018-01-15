class AddUserIdToArticles < ActiveRecord::Migration[5.1]
  def up
    add_column :articles, :user_id, :integer
  end
  def down
    remove_colum :articles, :user_id
  end
end
